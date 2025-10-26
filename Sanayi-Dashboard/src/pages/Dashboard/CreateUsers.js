import { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { baseURL, CREATEUSERS } from "../../Api/Api";
 import { getTokens } from "../../utils/SecureCookies";
export default function CreateUsers() {
  const [name, setName] = useState("");
  const [phoneNumber, setPhoneNumber] = useState("");
  const [role, setRole] = useState("");
  const [error, setError] = useState(false);
  const { token } = getTokens();;
  const navigate = useNavigate();

  const handleChangeRadio = (e) => setRole(e.target.value);

  async function notSubmit(e) {
    e.preventDefault();
    setError(false);

    try {
      await axios.post(
        `${baseURL}/${CREATEUSERS}`,
        { name, phoneNumber, role },
        { headers: { Authorization: `Bearer ${token}` } }
      );

      console.log("✅ User Created Successfully");
      navigate("/dashboard");
    } catch (error) {
      setError(true);
      console.error("❌ Error:", error.response?.data || error.message);
    }
  }

  return (
    <div className="create-container">
      <h1 className="create-title">Create New User</h1>

      <form onSubmit={notSubmit} className="create-form">
        <div className="form-group">
          <label htmlFor="name">Full Name</label>
          <input
            id="name"
            type="text"
            placeholder="Enter user name..."
            value={name}
            onChange={(e) => setName(e.target.value)}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="phone">Phone Number</label>
          <input
            id="phone"
            type="number"
            placeholder="Enter phone number..."
            value={phoneNumber}
            onChange={(e) => setPhoneNumber(e.target.value)}
            required
          />
        </div>

        <div className="form-group role">
          <label>Role</label>
          <div className="radio-group">
            <label>
              <input
                type="radio"
                value="client"
                checked={role === "client"}
                onChange={handleChangeRadio}
              />
              Client
            </label>
            <label>
              <input
                type="radio"
                value="craftsman"
                checked={role === "craftsman"}
                onChange={handleChangeRadio}
              />
              Craftsman
            </label>
          </div>
        </div>

        <button type="submit" className="submit-btn">
          Create User
        </button>
      </form>
    </div>
  );
}
