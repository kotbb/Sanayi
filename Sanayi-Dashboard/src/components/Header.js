import "../styles/header.css";
import { Link } from "react-router-dom";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMoon, faSun } from "@fortawesome/free-solid-svg-icons";
import { themModeContext } from "../pages/WebSite/Context/ThemeModeContext";
import { login } from "../pages/WebSite/Context/LoginContext";
import { AuthContext } from "../pages/WebSite/Context/AuthContext";

export default function Header() {
  const { darkMode, setDarkMode } = useContext(themModeContext);
  const { showLogin, setShowLogin } = useContext(login);
  const { token } = useContext(AuthContext); // ✅ استخدم الـ Context

  return (
    <header className={`header ${darkMode ? "dark" : ""}`}>
      <nav className="navbar">
        {/* شعار الموقع */}
        <div className="logo">
          <img
            src={require("../Assest/logo.png")}
            alt="Sanayi Logo"
            className="logo-img"
          />
        </div>

        {/* الجانب الأيمن */}
        <div className="right-space">
          {/* تبديل الوضع الليلي */}
          <button
            className="icon-btn"
            onClick={() => setDarkMode(!darkMode)}
            aria-label="Toggle Dark Mode"
          >
            <FontAwesomeIcon icon={darkMode ? faSun : faMoon} />
          </button>

          {/* عرض الأزرار حسب حالة التوكن */}
          {!token ? (
            <Link
              onClick={() => setShowLogin(true)}
              to=""
              className={`btn-login ${darkMode ? "dark" : ""}`}
            >
              Login
            </Link>
          ) : (
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
