import { useContext } from "react";
import { themModeContext } from "./WebSite/Context/ThemeModeContext";
import Login from "./WebSite/Auth/Login";
import { login } from "./WebSite/Context/LoginContext";
import "../styles/Splash.css"
export default function Splash() {
  const { darkMode } = useContext(themModeContext);
  const { showLogin, setShowLogin } = useContext(login); // نحتاج setShowLogin للزر X

  return (
    <div className={`splash-content${darkMode ? " dark" : ""}`}>
      <div className="img">
        <img src={require("../Assest/logo.png")} alt="##" />
      </div>

      <div className="content">
        <h1>Sanyia</h1>
        <h3>title WebSite</h3>
        <h5>
          title web Site title web Site title web Site title web Site title web
          Site...
        </h5>
      </div>

      {/* عرض واجهة تسجيل الدخول في المنتصف مع خلفية شفافة فقط */}
      {showLogin && (
        <div className="login-overlay">
          <Login closeForm={() => setShowLogin(false)} />
        </div>
      )}
    </div>
  );
}
