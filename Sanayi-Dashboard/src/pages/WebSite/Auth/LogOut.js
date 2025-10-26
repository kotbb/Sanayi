import axios from "axios";
import { baseURL } from "../../../Api/Api";
import { LOGOUT } from "../../../Api/Api";
import Cookie from "cookie-universal";
import { useNavigate } from "react-router-dom";
import { useEffect, useState,  } from "react";
import LoadingSubmit from "../../Loading/Loading";
import { getTokens, removeTokens } from "../../../utils/SecureCookies";
export default function LogOut(){
    const [loading,setLoading]=useState(false);
    const cookie=Cookie();
    const navigate=useNavigate()
    async function handleLogout(){
         setLoading(true);
         const { token } = getTokens(); // ✅ استرجاع التوكن بعد فك التشفير
        try{
        const res= await axios.post(`${baseURL}/${LOGOUT}`,{},{
            headers:{
                Authorization: `Bearer ${token}`,
            }
        });
        console.log(res);
        removeTokens();
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