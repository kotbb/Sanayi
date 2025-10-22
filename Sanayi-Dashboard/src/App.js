import Footer from "./components/Footer";
import Header from "./components/Header";
import SideBar from "./components/SideBar";
import Tables from "./components/Tables";
import Dashboard from "./pages/Dashboard/Dashboard";
import Splash from "./pages/Splash";
import Login from "./pages/WebSite/Auth/Login";
import { Routes, Route } from "react-router-dom";
import Users from "./pages/Dashboard/Users";
import AddUsers from "./pages/Dashboard/CreateUsers";
import MangmentUsers from "./pages/Dashboard/MangmentUsers";
import RequireAuth from "./pages/WebSite/Auth/RequireAuth";
import PersistLogin from "./pages/WebSite/Auth/PersistLogin";
import CreateUsers from "./pages/Dashboard/CreateUsers";
import UpdateUsers from "./pages/Dashboard/UpdateUsers";
import Bookings from "./pages/Dashboard/Bookings";
import LogOut from "./pages/WebSite/Auth/LogOut";

function App() {
  return ( 
   <div className="container" >
      <Header /> {/* الهيدر دائم */}
     
      <Routes>
        <Route path="/" element={<Splash />} /> 
        
        <Route path="/login" element={ <Login />} />
        
        <Route element={<RequireAuth/>}>
        <Route path="/dashboard" element={<Dashboard />}>
          <Route path="users"    element={<Users/>}/>
          <Route path="MangmentUsers"    element={<MangmentUsers/>}/>
          <Route path="CreateUsers" element={<CreateUsers/>}/>
          <Route path="bookings" element={<Bookings/>}/>
          
        </Route>
        <Route path="/UpdateUsers" element={<UpdateUsers/>}/>
        <Route path="/logOut" element={<LogOut/>}/>
        </Route>
       
      </Routes>
   
    </div>
  );
}

export default App;
