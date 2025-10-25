import "../style.css"
import { Link } from "react-router-dom";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMoon,faSun } from "@fortawesome/free-solid-svg-icons";
import Cookie from "cookie-universal";
import { themModeContext } from "../pages/WebSite/Context/ThemeModeContext";
import { login } from "../pages/WebSite/Context/LoginContext";

export default function Header(){
  const {darkMode,setDarkMode}=useContext(themModeContext)
  const {showLogin,setShowLogin}=useContext(login);
    const cookie=Cookie()
     const token=cookie.get("token")
     console.log(token,"header");
     console.log("the state show login:",showLogin);
    return(
     <header className={`header ${darkMode ? "dark" : ""}`}>
      <nav className="navbar">
        {/* webSite Logo*/}
        <div className="logo">
          <img
            src={require("../Assest/logo.png")}
            alt="Sanayi Logo"
            className="logo-img"
          />
        </div>

        {/* الجهة اليمنى */}
        <div className="right-space">
          {/* DarkMode*/}
          <button
            className="icon-btn"
            onClick={() => setDarkMode(!darkMode)}
            aria-label="Toggle Dark Mode"
          >
            <FontAwesomeIcon icon={darkMode ? faSun : faMoon} />
          </button>

          {/* ✅ شرط عرض الأزرار حسب حالة التوكن */}
{!token ? (
  // 🔹 إذا لا يوجد توكن → أظهر زر تسجيل الدخول
  <Link
    onClick={() => setShowLogin(true)}
    to=""
    className={`btn-login ${darkMode ? "dark" : ""}`}
  >
    Login
  </Link>
) : (
  // 🔹 إذا يوجد توكن → أظهر زر الذهاب للموقع
  <Link
    to="/"
    className={`btn-login ${darkMode ? "dark" : ""}`}
  >
    Go To Website
  </Link>
)}
        </div>
      </nav>
    </header>
  );
}