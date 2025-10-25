import axios from "axios";
import Cookie from "cookie-universal";

export default function UpdateUsers({
  selectedUser,
  setSelectedUser,
  setIsEditing,
  setRefreshUseEffect,
}) {
  const cookie = Cookie();
  const token = cookie.get("token");

  // function save update
  async function handleSave() {
    try {
      const res = await axios.patch(
        `http://127.0.0.1:4000/api/users/${selectedUser.id}`,
        {
          name: selectedUser.name,
          phoneNumber: selectedUser.phoneNumber,
          role: selectedUser.role,
        },
        {
          headers: { Authorization: `Bearer ${token}` },
        }
      );
      console.log("selectedUser before update:", selectedUser);

      console.log("✅ User updated:", res.data);
      setIsEditing(false);
      setRefreshUseEffect((prev) => prev + 1); // لتحديث الجدول بعد التعديل
    } catch (error) {
      console.error("❌ Error updating user:", error);
    }
  }

  return (
    <div className="edit-overlay">
      <div className="edit-form">
        <h2>Edit User</h2>

        <label>Name:</label>
        <input
          type="text"
          value={selectedUser.name}
          onChange={(e) =>
            setSelectedUser({ ...selectedUser, name: e.target.value })
          }
        />

        <label>Phone Number:</label>
        <input
          type="text"
          value={selectedUser.phoneNumber}
          onChange={(e) =>
            setSelectedUser({ ...selectedUser, phoneNumber: e.target.value })
          }
        />

        <label>Role:</label>
        <div className="role-radio">
          <label>
            <input
              type="radio"
              value="client"
              checked={selectedUser.role === "client"}
              onChange={(e) =>
                setSelectedUser({ ...selectedUser, role: e.target.value })
              }
            />
            Client
          </label>
          <label>
            <input
              type="radio"
              value="craftsman"
              checked={selectedUser.role === "craftsman"}
              onChange={(e) =>
                setSelectedUser({ ...selectedUser, role: e.target.value })
              }
            />
            Craftsman
          </label>
        </div>

        <div className="edit-buttons">
          <button onClick={handleSave}>💾 Save</button>
          <button onClick={() => setIsEditing(false)}>❌ Cancel</button>
        </div>
      </div>
    </div>
  );
}
