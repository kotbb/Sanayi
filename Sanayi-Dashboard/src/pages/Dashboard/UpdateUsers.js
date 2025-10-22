import { useContext, useState } from "react"
import { useNavigate } from "react-router-dom";
import axios from "axios";
import Cookie from "cookie-universal";
export default function UpdateUsers(){
const [selectedUser, setSelectedUser] = useState(null); // المستخدم الذي سنعدله
const [isEditing, setIsEditing] = useState(false); // هل الفورم مفتوحة أم لا

    return (
       <div className="login-content">
            <h1>Add Users</h1>
       </div>
    )
}