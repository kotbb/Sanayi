import { useContext } from "react"
import { themModeContext } from "./WebSite/Context/ThemeModeContext"

export default function Splash(){
  const {darkMode}=useContext(themModeContext);
  console.log("the splash theam:",darkMode);
    return(
        <div className={`splash-content${darkMode ? " dark" : ""}`}>
         <div className="img">
            <img src={require("../Assest/logo.png")}alt="##"/>
         </div>
         <div className="content">
            <h1>Sanyia</h1>
            <h3>title WebSite</h3>
            <h5>title web Site title web Sitetitle web Sitetitle web Sitetitle web Sitetitle web Sitetitle web Sitetitle web Sitetitle web Sitetitle web Site</h5>  
          </div>   


        </div>
    )
};