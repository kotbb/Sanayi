import axios from "axios";
import { baseURL } from "../../../Api/Api";
import { LOGOUT } from "../../../Api/Api";
import Cookie from "cookie-universal";
import { useNavigate } from "react-router-dom";
import { useEffect, useState,  } from "react";
import LoadingSubmit from "../../Loading/Loading";
export default function LogOut(){
    const [loading,setLoading]=useState(false);
    const cookie=Cookie();
    const token=cookie.get("token");
    const navigate=useNavigate()
    async function handleLogout(){
         setLoading(true);
        try{
        const res= await axios.post(`${baseURL}/${LOGOUT}`,{},{
            headers:{
                Authorization: `Bearer ${token}`,
            }
        });
        console.log(res);
      cookie.remove("token", { path: "/" });
      cookie.remove("refreshToken", { path: "/" });
       navigate("/", { replace: true });
       //window.location.replace("/")
        setLoading(false);
       

        }catch (error){
            console.log(error);
            
        }finally{
            setLoading(false);
        }
    }
        useEffect(() => {
        handleLogout();
        }, []);
        
    return  <div>
        {loading&&<LoadingSubmit/>}
    </div>
       
}