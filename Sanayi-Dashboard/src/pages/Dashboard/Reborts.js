import {
  LineChart, Line,
  BarChart, Bar,
  PieChart, Pie, Cell,
  CartesianGrid, XAxis, YAxis, Tooltip, ResponsiveContainer
} from "recharts";
import { FaUsers, FaMoneyBillWave, FaClipboardCheck, FaStar } from "react-icons/fa";


export default function Reports() {
  // إحصائيات مختصرة
  const stats = {
    users: 3200,
    revenue: 15400,
    completedOrders: 890,
    ratings: 4.6,
  };

  // بيانات الشارتات
  const growthData = [
    { month: "يناير", value: 200 },
    { month: "فبراير", value: 400 },
    { month: "مارس", value: 800 },
    { month: "أبريل", value: 650 },
    { month: "مايو", value: 950 },
    { month: "يونيو", value: 1200 },
  ];

  const revenueData = [
    { month: "يناير", value: 2500 },
    { month: "فبراير", value: 4000 },
    { month: "مارس", value: 6000 },
    { month: "أبريل", value: 5500 },
    { month: "مايو", value: 7200 },
    { month: "يونيو", value: 8800 },
  ];

  const ordersData = [
    { name: "مكتملة", value: 890 },
    { name: "قيد التنفيذ", value: 320 },
    { name: "ملغاة", value: 120 },
  ];

  const ratingsData = [
    { star: "⭐ 5", value: 65 },
    { star: "⭐ 4", value: 20 },
    { star: "⭐ 3", value: 10 },
    { star: "⭐ 2", value: 3 },
    { star: "⭐ 1", value: 2 },
  ];

  const colors = ["#28a745", "#ffc107", "#dc3545"];

  return (
    <div className="reports-page">

      {/* الكروت العلوية */}
      <div className="reports-cards">
        <div className="report-card">
          <FaUsers className="icon users" />
          <h3>Users</h3>
          <p>{stats.users}</p>
        </div>
        <div className="report-card">
          <FaMoneyBillWave className="icon revenue" />
          <h3>Revenue</h3>
          <p>${stats.revenue}</p>
        </div>
        <div className="report-card">
          <FaClipboardCheck className="icon completed" />
          <h3>Completed Bookings</h3>
          <p>{stats.completedOrders}</p>
        </div>
        <div className="report-card">
          <FaStar className="icon ratings" />
          <h3>Overall evaluation</h3>
          <p>{stats.ratings}</p>
        </div>
      </div>

      {/* قسم الشارتات */}
      <div className="charts-grid">

        {/* نمو المستخدمين */}
        <div className="chart-section">
          <h2>User growth over the months</h2>
          <ResponsiveContainer width="100%" height={300}>
            <LineChart data={growthData}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="month" />
              <YAxis />
              <Tooltip />
              <Line type="monotone" dataKey="value" stroke="#007bff" strokeWidth={3} />
            </LineChart>
          </ResponsiveContainer>
        </div>

        {/* الإيرادات */}
        <div className="chart-section">
          <h2>Monthly revenue</h2>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={revenueData}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="month" />
              <YAxis />
              <Tooltip />
              <Bar dataKey="value" fill="#28a745" barSize={50} radius={[10, 10, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* حالة الطلبات */}
        <div className="chart-section">
          <h2>Status of Bookings</h2>
          <ResponsiveContainer width="100%" height={300}>
            <PieChart>
              <Pie
                data={ordersData}
                dataKey="value"
                nameKey="name"
                outerRadius={100}
                label
              >
                {ordersData.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={colors[index % colors.length]} />
                ))}
              </Pie>
              <Tooltip />
            </PieChart>
          </ResponsiveContainer>
        </div>

        {/* تقييمات المستخدمين */}
        <div className="chart-section">
          <h2>Distribution of ratings</h2>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={ratingsData}>
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="star" />
              <YAxis />
              <Tooltip />
              <Bar dataKey="value" fill="#ffc107" barSize={40} radius={[10, 10, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>

      </div>
    </div>
  );
}
