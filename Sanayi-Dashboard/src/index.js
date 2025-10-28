import React from 'react';
import ReactDOM from 'react-dom/client';
import {BrowserRouter as Router} from "react-router-dom"
import UserProvider from './pages/WebSite/Context/Context';
import App from './App';
import reportWebVitals from './reportWebVitals';
import { ThemModeProvider } from './pages/WebSite/Context/ThemeModeContext';
import ShowLogin from './pages/WebSite/Context/LoginContext';
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css"; // استيراد تنسيقات المكتبة
import { AuthProvider } from "./pages/WebSite/Context/AuthContext";





const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <Router>
    <ToastContainer
  position="top-right"  // مكان ظهور التوست
  autoClose={3000}      // يغلق بعد 3 ثوانٍ
  hideProgressBar={false}
  newestOnTop={false}
  closeOnClick
  rtl={true}            // دعم اللغة العربية (من اليمين لليسار)
  pauseOnFocusLoss
  draggable
  pauseOnHover
  theme="colored"       // أو "light" أو "dark"
 />
      
      <UserProvider>
        <ThemModeProvider>
          <ShowLogin>
            <AuthProvider>
        <App/>
        </AuthProvider>
        </ShowLogin>
        </ThemModeProvider>
      </UserProvider>
   
        
  </Router>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals

