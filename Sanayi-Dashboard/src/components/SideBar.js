import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUserPlus, faUsers ,faUsersGear,faArrowRightFromBracket} from "@fortawesome/free-solid-svg-icons";

export default function SideBar(){
   // <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
  
   return(
        
        <div className="aside-bar-contaner">
        
             <aside class="sidebar">
      
      <ul class="menu">
        <Link to={"users"}><li class="active"><FontAwesomeIcon icon={faUsers} /> Users</li></Link>
        <Link to={"CreateUsers"}><li class="active"><FontAwesomeIcon icon={faUserPlus}/> CreateUsers</li></Link>
        <Link to={"bookings"}><li class="active"><i class="fa fa-users"></i> Bookings</li></Link>
        <Link to={"MangmentUsers"}><li><FontAwesomeIcon icon={faUsersGear} /> Management Users</li></Link>
        <li><i class="fa fa-chart-bar"></i> Management  </li>
        <Link to={"/logOut"}><li><FontAwesomeIcon icon={faArrowRightFromBracket} />LogOut</li></Link>
      </ul>
    </aside>

        </div>

    )
    
};