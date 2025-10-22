import { useContext, useEffect, useState } from "react";
import axios from "axios";
import Cookie from "cookie-universal";
import { Link } from "react-router-dom";
import { faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPenToSquare } from "@fortawesome/free-solid-svg-icons";

export default function MangmentUsers() {
  // 🧠 حالات (States)
  const [allUsers, setAllUsers] = useState([]); // كل المستخدمين من الـ API
  const [filtered, setFiltered] = useState([]); // المستخدمون المعروضون بعد الفلترة
  const [search, setSearch] = useState(""); // نص البحث الحالي
  const [activeFilter, setActiveFilter] = useState("all"); // الفلتر النشط (all | client | craftsman)
  const [refreshUseEffecr,setRefreshUseEffect] = useState(0)
  const [selectedUser, setSelectedUser] = useState(null); // المستخدم الذي سنعدله
  const [isEditing, setIsEditing] = useState(false); // هل الفورم مفتوحة أم لا

  const cookie = Cookie();
  const token = cookie.get("token");

  // 📥 جلب جميع المستخدمين من السيرفر
  useEffect(() => {
    axios
      .get("http://127.0.0.1:4000/api/users", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((res) => {
        const allUsersArray = res.data.data.data
        console.log(allUsersArray);
        setAllUsers(allUsersArray);
        setFiltered(allUsersArray); // في البداية نعرض الجميع
        console.log("✅ All users fetched:", allUsersArray);
      })
      .catch((err) => console.log("❌ Error fetching users:", err));
  }, [refreshUseEffecr]);

  // 🎯 دالة تقوم بالفلترة حسب الدور والبحث في نفس الوقت
  useEffect(() => {
    let temp = [...allUsers];

    // أولاً فلترة حسب الدور
    if (activeFilter === "client") {
      temp = temp.filter((u) => u.role === "client");
    } else if (activeFilter === "craftsman") {
      temp = temp.filter((u) => u.role === "craftsman");
    }

    // ثانياً فلترة حسب نص البحث
    if (search.trim() !== "") {
      temp = temp.filter(
        (u) =>
          u.name.toLowerCase().includes(search.toLowerCase()) ||
          u.phoneNumber.toLowerCase().includes(search.toLowerCase()) ||
          u.role.toLowerCase().includes(search.toLowerCase())
      );
    }

    setFiltered(temp);
  }, [activeFilter, search, allUsers]); // أي تغيير في هذه القيم يعيد الفلترة

  // ⚙️ دوال تغيير الفلاتر عند الضغط على الأزرار
  function showAll() {
    setActiveFilter("all");
  }

  function showClients() {
    setActiveFilter("client");
  }

  function showCraftsmen() {
    setActiveFilter("craftsman");
  }
  async function deleteCraftMan(id){
        const res= await axios.delete(`http://127.0.0.1:4000/api/users/${id}`,{headers:{
        Authorization: `Bearer ${token}`
      
        
     }}); 
    try{
     console.log("|the id delete is",id);
   setRefreshUseEffect((prev)=>prev+1)
    }catch{
        console.log("|the id delete is",id);
        console.log(refreshUseEffecr);
       
    }
}

console.log("the filtered is:",filtered);
function handleEdit(user) {
  setSelectedUser(user);
  setIsEditing(true);
}
async function handleSave() {
  try {
    const res = await axios.put(
      `http://127.0.0.1:4000/api/users/${selectedUser.id}`,
      {
        name: selectedUser.name,
        phoneNumber: selectedUser.phoneNumber,
        role: selectedUser.role,
      },
      {
        headers: { Authorization: `Bearer ${token}` },
      }
    );

    console.log("✅ User updated:", res.data);
    setIsEditing(false);
    setRefreshUseEffect((prev) => prev + 1); // لإعادة تحميل الجدول بعد الحفظ
  } catch (error) {
    console.error("❌ Error updating user:", error);
  }
}

  return (
    <div className="table-container">
      <div className="title-div">
        <div className="title">
          {/* 🔘 أزرار الفلترة */}
          <div className="tabs">
            <button
              className={`tab-All ${activeFilter === "all" ? "active" : ""}`}
              onClick={showAll}
            >
              All Users
            </button>
            <button
              className={`tab-Clients ${activeFilter === "client" ? "active" : ""}`}
              onClick={showClients}
            >
              Clients
            </button>
            <button
              className={`tab-Craftsman ${activeFilter === "craftsman" ? "active" : ""}`}
              onClick={showCraftsmen}
            >
              Craftsmen
            </button>
          </div>

          {/* 🔍 مربع البحث */}
          <div className="search-box">
            <i className="fa fa-search"></i>
            <input
              type="text"
              placeholder="Search by name, phone or role..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
        </div>
      </div>

      {/* 📊 جدول عرض المستخدمين */}
      <table>
        <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Phone Number</th>
            <th>Role</th>
            <th>Delete</th>
            
          </tr>
        </thead>
        <tbody>
          {filtered.length > 0 ? (
            filtered.map((i, index) => (
              <tr key={index}>
                <td>{index + 1}</td>
                <td>{i.name}</td>
                <td>{i.phoneNumber}</td>
                <td>{i.role}</td>
                <td><span onClick={()=>deleteCraftMan(i.id)}><FontAwesomeIcon icon={faTrash}style={{color:"red",cursor:"pointer",fontSize:"22px"}}/></span><span onClick={() => handleEdit(i)}><FontAwesomeIcon icon={faPenToSquare}style={{color:"blue",cursor:"pointer",fontSize:"22px"}} /></span></td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan="4" style={{ textAlign: "center" }}>
                No users found
              </td>
            </tr>
          )}
        </tbody>
      </table>
      {isEditing && selectedUser && (
  <div className="edit-overlay">
    <div className="edit-form">
      <h2>Edit User</h2>
      <label>Name:</label>
      <input
        type="text"
        value={selectedUser.name}
        onChange={(e) =>
          setSelectedUser({ ...selectedUser, name: e.target.value })
        }
      />

      <label>Phone Number:</label>
      <input
        type="text"
        value={selectedUser.phoneNumber}
        onChange={(e) =>
          setSelectedUser({ ...selectedUser, phoneNumber: e.target.value })
        }
      />

      <label>Role:</label>
      <div className="role-radio">
        <label>
          <input
            type="radio"
            value="client"
            checked={selectedUser.role === "client"}
            onChange={(e) =>
              setSelectedUser({ ...selectedUser, role: e.target.value })
            }
          />
          Client
        </label>
        <label>
          <input
            type="radio"
            value="craftsman"
            checked={selectedUser.role === "craftsman"}
            onChange={(e) =>
              setSelectedUser({ ...selectedUser, role: e.target.value })
            }
          />
          Craftsman
        </label>
      </div>

      <div className="edit-buttons">
        <button onClick={handleSave}>Save</button>
        <button onClick={() => setIsEditing(false)}>Cancel</button>
      </div>
    </div>
  </div>
)}
    </div>
  );
}
