import { Link, useLocation } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUserPlus, faUsers, faUsersGear, faArrowRightFromBracket, faChartLine } from "@fortawesome/free-solid-svg-icons";
import { useContext } from "react";
import { themModeContext } from "../pages/WebSite/Context/ThemeModeContext";

export default function SideBar() {
  const { darkMode } = useContext(themModeContext);
  const location = useLocation(); // لمعرفة الصفحة الحالية لتفعيل الزر النشط

  // 🟢 دالة لتحديد الصف النشط
  const isActive = (path) => location.pathname.includes(path);

  return (
    <div className={`aside-bar-contaner${darkMode ? " dark" : ""}`}>
      <aside className="sidebar">
        <ul className="menu">
          <Link to={"users"}>
            <li className={isActive("users") ? "active" : ""}>
              <FontAwesomeIcon icon={faUsers}style={{color:"black",cursor:"pointer",fontSize:"22px"}} /> Users
            </li>
          </Link>
          <Link to={"CreateUsers"}>
            <li className={isActive("CreateUsers") ? "active" : ""}>
              <FontAwesomeIcon icon={faUserPlus}style={{color:"black",cursor:"pointer",fontSize:"22px"}} /> Create Users
            </li>
          </Link>
          <Link to={"bookings"}>
            <li className={isActive("bookings") ? "active" : ""}>
              <FontAwesomeIcon icon={faUsers}style={{color:"black",cursor:"pointer",fontSize:"22px"}} /> Bookings
            </li>
          </Link>
          <Link to={"MangmentUsers"}>
            <li className={isActive("MangmentUsers") ? "active" : ""}>
              <FontAwesomeIcon icon={faUsersGear} style={{color:"black",cursor:"pointer",fontSize:"22px"}}/> Management Users
            </li>
          </Link>
          <Link to={"reborts"}>
            <li className={isActive("reborts") ? "active" : ""}>
              <FontAwesomeIcon icon={faChartLine}style={{color:"black",cursor:"pointer",fontSize:"22px"}} /> Reports
            </li>
          </Link>
          <Link to={"/logOut"}>
            <li>
              <FontAwesomeIcon icon={faArrowRightFromBracket} style={{color:"black",cursor:"pointer",fontSize:"22px"}}/> LogOut
            </li>
          </Link>
        </ul>
      </aside>
    </div>
  );
}
