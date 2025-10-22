
import { useContext, useState } from "react"
import { user } from "../WebSite/Context/Context";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import Cookie from "cookie-universal";

export default function CreateUsers(){
const [name,setName]=useState("");
const [phoneNumber,setphoneNumber]=useState("");
const [role,setRole]=useState("");
const [userId,setUserId]=useState("");
//const [date,setDate]=useState("");
const [error,setError]=useState(false)
const cookie=Cookie();

//const [accept,setAccept]=useState(false);
console.log(name);
console.log(phoneNumber);
console.log(role);
    
    //const Cuser=useContext(user);
    const token =cookie.get("token");
//    console.log(token);

    const navigate=useNavigate();
    //console.log(phoneNumber, password);
    const handleChangeRadio=(e)=>{
        setRole(e.target.value)
    }
        async function notSubmit(e){
            e.preventDefault();
            try{
                //admin:    01234567899
                //run  :    npm run start:dev
                let res=await axios.post("http://127.0.0.1:4000/api/users",
                    {name:name,phoneNumber:phoneNumber,role:role },{
                     headers:{
                    Authorization: `Bearer ${token}`
                    },
                }
                   
            );
                console.log(res.data);
                //const usersDet=res.data.data.user;//*
              //  const token =res.data.token;
               // console.log("the token is :"+token);
               // Cuser.setAuth({token,usersDet})
              //  console.log(user.auth);
                //console.log(usersDet);
                
                console.log("the add users is done");
                //console.log(token);
               
            }catch(error){

                    console.error(error.response?.data || error.message);
    }
   navigate("/dashboard");

            
        }
return(
        <div className="login-content">
            <h1>Add Users</h1>
            <form  onSubmit={notSubmit}>
                <div className="name">
                    <label htmlFor="name">Name:</label>
                    <input id="name" type="text" placeholder="Name..." required value={name} onChange={(e)=>setName(e.target.value)}/>
                    {name.length<0 &&error&&<p>the name is required</p>}
                 
                </div>
                <div className="phoneNumber">
                      <label htmlFor="phoneNumber">PhoneNumber:</label>
                      <input id="phoneNumber" type="number" placeholder="phoneNumber..." required value={phoneNumber} onChange={(e)=>setphoneNumber(e.target.value)}/>
                      {phoneNumber.length <8 &&error&&<p>the PhoneNumber is Rhong</p>}
                </div>
                  <div className="rol">
                      <label htmlFor="rol">Role:</label>
                      <label>client<input type="radio" value="client" checked={role=="client"} onChange={handleChangeRadio}></input></label>
                       <label>craftsman<input type="radio" value="craftsman" checked={role=="craftsman"} onChange={handleChangeRadio}></input></label>    
                    </div>
                    
                  
                <button type="submit">Create Users </button>
            </form> 
            

        </div>
    )}


