import "../style.css"
import { Link } from "react-router-dom";
import { user } from "../pages/WebSite/Context/Context";
import { useContext } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMoon } from "@fortawesome/free-solid-svg-icons";
import { faSun } from "@fortawesome/free-solid-svg-icons";
import Cookie from "cookie-universal";
import { themModeContext } from "../pages/WebSite/Context/ThemeModeContext";

export default function Header(){
    const {darkMode,setDarkMode}=useContext(themModeContext)
    const cookie=Cookie()
     const token=cookie.get("toekn")
     console.log(token,"header");
    return(
        <div className={`header${darkMode?" dark":""}`} >
            <nav>   
                <div className="logo"> <img src={require("../Assest/logo.png")}alt="##"/></div>
                <div className="right-space">
                    <div className="icons">
                        <span className="dark-mode" ><FontAwesomeIcon icon={!darkMode?faMoon:faSun} onClick={()=>setDarkMode(!darkMode,console.log(darkMode))}/></span>
                    </div>
                    {
                      !token&&(
                    <Link to = "/Login" className={`buttons${darkMode?" dark":""}`}>Login</Link>
                         )
                      }  
                </div>
            </nav>
        

        </div>
    )
};