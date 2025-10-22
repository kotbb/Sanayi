import { useContext, useEffect, useState } from "react";
import axios from "axios";
import Cookie from "cookie-universal";
import { baseURL } from "../../Api/Api";

export default function Users() {
  //  حالات (States)
  const [allUsers, setAllUsers] = useState([]); // كل المستخدمين من الـ API
  const [filtered, setFiltered] = useState([]); // المستخدمون المعروضون بعد الفلترة
  const [search, setSearch] = useState(""); // نص البحث الحالي
  const [activeFilter, setActiveFilter] = useState("all"); // الفلتر النشط (all | client | craftsman)
  const cookie = Cookie();
  const token = cookie.get("token");
  const refreshToken = cookie.get("refreshToken");
  // 📥 جلب جميع المستخدمين من السيرفر
  useEffect(() => {
    axios
      .get("http://127.0.0.1:4000/api/users", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((res) => {
        const allUsersArray = res.data.data.data;
        setAllUsers(allUsersArray);
        setFiltered(allUsersArray); // في البداية نعرض الجميع
        console.log("✅ All users fetched:", allUsersArray);
      })
      .catch((err) => console.log("❌ Error fetching users:", err));
  }, []);

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
  // دوال تغيير الفلاتر عند الضغط على الأزرار
  function showAll() {
    setActiveFilter("all");
  }
  function showClients() {
    setActiveFilter("client");
  }
  function showCraftsmen() {
    setActiveFilter("craftsman");
  }
  async function refToken(){
    try{
      const res = await axios.post(`${baseURL}/auth/refresh-token`,{ refreshToken: refreshToken },{
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      console.log(res)
      const newToken=res.data.token
      const newRefToken = res.data.refreshToken;
      cookie.set("token", newToken);
      cookie.set("refreshToken", newRefToken);
      
    }catch (error){
      console.log(error);
    }
  }
  useEffect(() => {
  const interval = setInterval(() => {
    refToken();// استدعاء التجديد تلقائيًا
  }, 9 * 60 * 1000); // كل 9 دقائق (مثلاً)
  

  return () => clearInterval(interval); // تنظيف عند إلغاء المكون
}, []);
useEffect(() => {
  const token = cookie.get("token");
  const refreshToken = cookie.get("refreshToken");

  console.log("Token on page load:", token);
  console.log("Refresh Token on page load:", refreshToken);
}, []); 
  return (
    <div className="table-container">
      <div className="title-div">
        <div className="title">
          {/*  أزرار الفلترة */}
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
        <button onClick={refToken} type="submit"> refrechToken</button>
      </table>
    </div>
  );
}
