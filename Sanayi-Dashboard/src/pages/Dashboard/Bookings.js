import axios from "axios";
import { useEffect, useState } from "react";
import Cookie from "cookie-universal";
import { baseURL, BOOKINGS } from "../../Api/Api";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTrash } from "@fortawesome/free-solid-svg-icons";

export default function Bookings() {
  const [allBookings, setAllBookings] = useState([]);
  const [loading, setLoading] = useState(false);
  const cookie = Cookie();
  const token = cookie.get("token");

  // 🔹 getData
  useEffect(() => {
    async function getBookings() {
      try {
        const res = await axios.get(`${baseURL}/${BOOKINGS}`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        console.log("Response:", res.data);
        const bookings = res.data.data.data;
        setAllBookings(bookings);
      } catch (error) {
        console.error("Error fetching bookings:", error);
      }
    }

    getBookings();
  }, [token]);

  //Delete function
  async function handleDelete(id) {
    const confirmDelete = window.confirm("Are you sure you want to delete this request?");
    if (!confirmDelete) return;

    try {
      setLoading(true);

      // delete request
      await axios.delete(`${baseURL}/${BOOKINGS}/${id}`, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      //update list for delete
      setAllBookings((prev) => prev.filter((item) => item._id !== id));
      alert("✅ The request has been successfully deleted");
    } catch (error) {
      console.error("❌ حدث خطأ أثناء الحذف:", error);
      alert("حدث خطأ أثناء حذف الطلب");
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="bookings-page">
      <h2>قائمة الطلبات</h2>
      {loading && <p>The operation is in progress...</p>}

      <table>
        <thead>
          <tr>
            <th>id</th>
            <th>Customer name</th>
            <th>Phone number</th>
            <th>Craftman name</th>
            <th>Booking date</th>
            <th>time</th>
            <th>Order status</th>
            <th>Action</th>
          </tr>
        </thead>

        <tbody>
          {Array.isArray(allBookings) && allBookings.length > 0 ? (
            allBookings.map((item, index) => (
              <tr key={item._id}>
                <th>{index + 1}</th>
                <td>{item.client?.name || "Nothing Name"}</td>
                <td>{item.client?.phoneNumber || "Nothing phone number"}</td>
                <td>{item.craftsman?.name || "Nothing craftsman Name"}</td>
                <td>{new Date(item.date).toLocaleDateString()}</td>
                <td>{item.time}</td>
                <td>{item.status}</td>
                <td>
                  <FontAwesomeIcon
                    icon={faTrash}
                    style={{ color: "red", cursor: "pointer", fontSize: "22px" }}
                    onClick={() => handleDelete(item._id)}
                  />
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan="8">No Booking found</td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
}
