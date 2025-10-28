import { useEffect, useState } from "react";
import axios from "axios";
import { baseURL, REFRESHTOKEN } from "../../Api/Api";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMagnifyingGlass } from "@fortawesome/free-solid-svg-icons";
import { getTokens, setEncryptedCookie } from "../../utils/SecureCookies";
import Footer from "../../components/Footer";
import "../../styles/Users.css"

export default function Users() {
  const [allUsers, setAllUsers] = useState([]);
  const [filtered, setFiltered] = useState([]);
  const [search, setSearch] = useState("");
  const [activeFilter, setActiveFilter] = useState("all");
  const [updatingIds, setUpdatingIds] = useState(new Set());

  const { token, refreshToken } = getTokens();

  // ✅ جلب المستخدمين
  useEffect(() => {
    if (!token) {
      console.warn("⚠️ No token found, redirect to login maybe.");
      return;
    }

    axios
      .get(`${baseURL}/users`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      })
      .then((res) => {
        const allUsersArray = res.data.data.data;
        setAllUsers(allUsersArray);
        setFiltered(allUsersArray);
      })
      .catch((err) => console.log("❌ Error fetching users:", err));
  }, [token]);

  // ✅ فلترة
  useEffect(() => {
    let temp = [...allUsers];

    if (activeFilter === "client") temp = temp.filter((u) => u.role === "client");
    else if (activeFilter === "craftsman") temp = temp.filter((u) => u.role === "craftsman");

    if (search.trim() !== "") {
      temp = temp.filter(
        (u) =>
          u.name.toLowerCase().includes(search.toLowerCase()) ||
          u.phoneNumber.toLowerCase().includes(search.toLowerCase()) ||
          u.role.toLowerCase().includes(search.toLowerCase())
      );
    }

    setFiltered(temp);
  }, [activeFilter, search, allUsers]);

  // ✅ تجديد التوكنات
  async function refreshTokens() {
    if (!refreshToken) {
      console.warn("⚠️ No refresh token found");
      return;
    }

    try {
      const res = await axios.post(`${baseURL}/${REFRESHTOKEN}`, { refreshToken });
      const { token: newToken, refreshToken: newRefresh } = res.data;

      // 🔐 تخزين مشفر
      setEncryptedCookie("token", newToken);
      setEncryptedCookie("refreshToken", newRefresh);

      console.log("♻️ Tokens refreshed successfully");
    } catch (err) {
      console.error("❌ Failed to refresh tokens:", err);
    }
  }

  // 🔄 كل 9 دقائق يتم التجديد تلقائيًا
  useEffect(() => {
    const interval = setInterval(refreshTokens, 10 * 60 * 1000);
    return () => clearInterval(interval);
  }, []);

  // ✅ واجهة العرض
  return (
    <div className="table-container">
      <div className="title-div">
        <div className="title">
          <div className="tabs">
            <button className={`tab-All ${activeFilter === "all" ? "active" : ""}`} onClick={() => setActiveFilter("all")}>All Users</button>
            <button className={`tab-Clients ${activeFilter === "client" ? "active" : ""}`} onClick={() => setActiveFilter("client")}>Clients</button>
            <button className={`tab-Craftsman ${activeFilter === "craftsman" ? "active" : ""}`} onClick={() => setActiveFilter("craftsman")}>Craftsmen</button>
          </div>

          <div className="search-box">
            <FontAwesomeIcon icon={faMagnifyingGlass} />
            <input
              type="text"
              placeholder="Search by name, phone or role..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
        </div>
      </div>

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
            filtered.map((u, i) => (
              <tr key={i}>
                <td>{i + 1}</td>
                <td>{u.name}</td>
                <td>{u.phoneNumber}</td>
                <td>{u.role}</td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan="4" style={{ textAlign: "center" }}>No users found</td>
            </tr>
          )}
        </tbody>
      </table>
      <Footer />
    </div>
  );
}
