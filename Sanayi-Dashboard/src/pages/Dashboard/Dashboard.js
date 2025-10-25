import { Outlet } from "react-router-dom";
import SideBar from "../../components/SideBar";
import Header from "../../components/Header";



export default function Dashboard(){
    return(
        <div className="dashboard" >       
            <SideBar/>
            <div className="dashboard-content">
               
                 <Outlet/>
            </div>
        </div>
    )
}