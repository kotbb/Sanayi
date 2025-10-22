import axios from "axios"
import { useEffect, useState } from "react"
import Cookie from "cookie-universal";
import { baseURL } from "../../Api/Api";
import { BOOKINGS } from "../../Api/Api";

export default function Bookings(){
    const [allBookings,setAllBookings]=useState([]);
    const cookie=Cookie();
    const token=cookie.get("token");
    useEffect(()=>{
        axios.get(`${baseURL}/${BOOKINGS}`,{
            headers:{
               Authorization: `Bearer ${token}`,
            }
        }).then((res)=>{
            const resAllBookings=res.data.data.data
            setAllBookings(resAllBookings)
            console.log(resAllBookings);
        });

    },[])
    return (
        <div>
             <table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>PhoneNumber</th>
            <th>CreatedAt</th>
            <th>Rating</th>
            <th>Action</th>
            
        </tr>
        </thead>

        <tbody>
        {Array.isArray(allBookings) &&
            allBookings.map((i, index) => (
            <tr key={index}>
                <td>{index + 1}</td>
                <td>{i[index]}</td>
                <td>{i.client.phoneNumber}</td>
                <td>{i.averageRating}</td>
                
                <td><span>Delete</span></td>

            </tr>
            ))}
        </tbody>
    </table>
        </div>
    )
}