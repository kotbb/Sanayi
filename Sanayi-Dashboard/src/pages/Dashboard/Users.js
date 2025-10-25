import { useEffect, useState } from "react";
import axios from "axios";
import Cookie from "cookie-universal";
import { baseURL, REFRESHTOKEN } from "../../Api/Api";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

import { faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import Footer from "../../components/Footer";

export default function Users() {
  // 🎯 حالات (States)
  const [allUsers, setAllUsers] = useState([]); // كل المستخدمين القادمين من API
  const [filtered, setFiltered] = useState([]); // المستخدمون المعروضون بعد الفلترة
  const [search, setSearch] = useState(""); // النص الذي يكتبه المستخدم للبحث
  const [activeFilter, setActiveFilter] = useState("all"); // الفلتر النشط (الكل | عميل | حرفي)

  // 🧁 الكوكيز للحصول على التوكنات
  const cookie = Cookie();
  const token = cookie.get("token");
  const refreshToken = cookie.get("refreshToken");
  //get All users
  useEffect(() => {
    axios
      .get("http://127.0.0.1:4000/api/users", {
        headers: {
          Authorization: `Bearer ${token}`, // تمرير التوكن في الهيدر
        },
      })
      .then((res) => {
        const allUsersArray = res.data.data.data; // استخراج المصفوفة الحقيقية للمستخدمين
        setAllUsers(allUsersArray);
        setFiltered(allUsersArray); // عرض الجميع مبدئيًا
        console.log("✅ All users fetched:", allUsersArray);
      })
      .catch((err) => console.log("❌ Error fetching users:", err));
  }, []); // 👈 يحدث مرة واحدة فقط عند تحميل الصفحة

  // 🧩 فلترة المستخدمين حسب الدور والبحث في نفس الوقت
  useEffect(() => {
    let temp = [...allUsers];

    // 🔹 أولًا: الفلترة حسب الدور
    if (activeFilter === "client") {
      temp = temp.filter((u) => u.role === "client");
    } else if (activeFilter === "craftsman") {
      temp = temp.filter((u) => u.role === "craftsman");
    }

    // 🔹 ثانيًا: الفلترة حسب البحث
    if (search.trim() !== "") {
      temp = temp.filter(
        (u) =>
          u.name.toLowerCase().includes(search.toLowerCase()) ||
          u.phoneNumber.toLowerCase().includes(search.toLowerCase()) ||
          u.role.toLowerCase().includes(search.toLowerCase())
      );
    }

    setFiltered(temp); // تحديث النتيجة النهائية
  }, [activeFilter, search, allUsers]); // 👈 يُعاد تنفيذها عند أي تغيير

  // 🧭 دوال لتغيير الفلاتر (الأزرار)
  function showAll() {
    setActiveFilter("all");
  }
  function showClients() {
    setActiveFilter("client");
  }
  function showCraftsmen() {
    setActiveFilter("craftsman");
  }

  // function refrech token
  async function refToken() {
    try {
      const res = await axios.post(
        `${baseURL}/${REFRESHTOKEN}`,
        { refreshToken: refreshToken },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      // ✅ استخراج التوكنات الجديدة
      const newToken = res.data.token;
      const newRefToken = res.data.refreshToken;

      // update tokens
      cookie.set("token", newToken);
      cookie.set("refreshToken", newRefToken);

      console.log("♻️ Tokens refreshed successfully!");
    } catch (error) {
      console.log("❌ Error refreshing token:", error);
    }
  }

  // ⏱️ تنفيذ تجديد التوكن كل 9 دقائق تلقائيًا
  useEffect(() => {
    const interval = setInterval(() => {
      refToken(); 
    }, 9 * 60 * 1000); 

    return () => clearInterval(interval); // تنظيف عند إزالة المكون
  }, []);

 
  useEffect(() => {
    const token = cookie.get("token");
    const refreshToken = cookie.get("refreshToken");

    console.log("🔑 Token on page load:", token);
    console.log("🔁 Refresh Token on page load:", refreshToken);
  }, []);

  return (
    <div className="table-container">
      {/* 🧩 القسم العلوي: الفلاتر والبحث */}
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

          {/* 🔍 search box*/}
          <div className="search-box">
            <FontAwesomeIcon icon={faMagnifyingGlass} />
            <input
            
              type="text"
              placeholder=" Search by name, phone or role..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
        </div>
      </div>

      {/* table show users*/}
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
                <th>{index + 1}</th>
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
      </table>

      
    
    </div>
    
  );
}
