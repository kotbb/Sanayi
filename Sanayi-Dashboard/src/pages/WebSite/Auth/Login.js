import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom";
import axios from "axios";
import Cookie from "cookie-universal";
import LoadingSubmit from "../../Loading/Loading";
import { baseURL } from "../../../Api/Api";
import { LOGIN } from "../../../Api/Api";
import { saveTokens } from "../../../utils/SecureCookies";
export default function Login({ closeForm }){
    const [phoneNumber,setPhoneNumber] =useState("");
    const [password,setPassword]=useState("");
    const [error,setError]=useState(false)
    const [loading,setLoading]=useState(false);
    const navigate=useNavigate();
    const cookie=Cookie();
   // console.log(phoneNumber, password);
    async function handleSubmit(e){
            e.preventDefault();
            setLoading(true);
            try{
                //admin:    01234567899
                //run  :    npm run start:dev
                let res=await axios.post(`${baseURL}/${LOGIN}`,{phoneNumber:phoneNumber,password:password},);
                console.log(res.data);
                const refreshToken =res.data.refreshToken;
                const token  =res.data.token;
                setLoading(false)
                navigate("/dashboard"); 
                
                saveTokens(token, refreshToken);
                
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

 return (
    <>
      {loading && <LoadingSubmit />}

      <div className="login-popup">
        {/* زر الإغلاق */}
        <button className="close-btn" onClick={closeForm}>
          &times;
        </button>

        <div className="login-content">
          <h1>Welcome Admin 👋</h1>
          <p className="login-subtitle">
            Please log in to access your dashboard
          </p>

          <form onSubmit={handleSubmit}>
            <div className="input-group">
              <label htmlFor="phoneNumber">Phone Number</label>
              <input
                id="phoneNumber"
                type="number"
                placeholder="Enter your phone number"
                required
                value={phoneNumber}
                onChange={(e) => setPhoneNumber(e.target.value)}
                className={error && phoneNumber.length < 9 ? "error-field" : ""}
              />
              {phoneNumber.length < 9 && error && (
                <p className="error-text">Invalid phone number</p>
              )}
            </div>

            <div className="input-group">
              <label htmlFor="password">Password</label>
              <input
                id="password"
                type="password"
                placeholder="Enter your password"
                required
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                className={error && password.length < 8 ? "error-field" : ""}
              />
              {password.length < 8 && error && (
                <p className="error-text">
                  Password must be at least 8 characters
                </p>
              )}
            </div>

            <button type="submit" className="btn-login-form">
              Log In
            </button>
          </form>
        </div>
      </div>
    </>
  );
}
