import { useContext } from "react";
import { user } from "../Context/Context";
import { Form, Navigate, Outlet, useLocation } from "react-router-dom";
import Login from "./Login";
import Cookie from "cookie-universal";

export default function RequireAuth(){
   const cookie=Cookie();
   const token=cookie.get("token"); 
   const location=useLocation() 
   return  token?<Outlet/>:<Navigate state={{from:location}}replace to="/login"/>; 
   //console.log(token.auth.user);
};  