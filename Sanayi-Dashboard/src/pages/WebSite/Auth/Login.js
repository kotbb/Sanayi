import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom";
import axios from "axios";
import Cookie from "cookie-universal";
import LoadingSubmit from "../../Loading/Loading";
export default function Login(){
    const [phoneNumber,setPhoneNumber] =useState("");
    const [password,setPassword]=useState("");
    const [error,setError]=useState(false)
    const [loading,setLoading]=useState(false);
    const navigate=useNavigate();
    const cookie=Cookie();
   // console.log(phoneNumber, password);
    async function notSubmit(j){
            j.preventDefault();
            setLoading(true);
            try{
                //admin:    01234567899
                //run  :    npm run start:dev
                let res=await axios.post("http://127.0.0.1:4000/api/auth/login/admin",{phoneNumber:phoneNumber,password:password},);
                console.log(res.data);
                const refreshToken =res.data.refreshToken;
                const token  =res.data.token;
                setLoading(false)
                navigate("/dashboard"); 
                cookie.set("token",token)
                cookie.set("refreshToken",refreshToken);
                // console.log("the token is :"+token);
                //console.log("the login is done");
                }catch(error){
                setLoading(false);
               // console.log("Login error",error);
                if(error.response?.status ===422){
                    setError(true);
                }else {
                    console.error(error.response?.data || error.message);
                }
                    }
                }

return(
    <>
        {loading &&<LoadingSubmit/>}
        <div className="login-content">
            <h1>Log In</h1>
            <form  onSubmit={notSubmit}>
                <div className="name">
                    <label htmlFor="name">phoneNumber:</label>
                    <input id="phoneNumber" type="number" placeholder="phoneNumber..." required value={phoneNumber} onChange={(e)=>setPhoneNumber(e.target.value)}/>
                    {phoneNumber.length<9&&error&&<p>the Number is Rhong</p>}
                </div>
                <div className="password">
                      <label htmlFor="password">Password:</label>
                      <input id="password" type="password" placeholder="Password..." required value={password} onChange={(e)=>setPassword(e.target.value)}/>
                      {password.length <8 &&error&&<p>the password is Rhong</p>}
                </div>
                <button type="submit">Log In</button>
            </form> 
            
            

        </div>
        </>
    )}
