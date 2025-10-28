// src/context/AuthContext.js
import { createContext, useState, useEffect } from "react";
import { getTokens } from "../../../utils/SecureCookies";

export const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [token, setToken] = useState(getTokens().token);

  // مراقبة التوكن من الكوكيز بشكل دوري
  useEffect(() => {
    const interval = setInterval(() => {
      const currentToken = getTokens().token;
      if (currentToken !== token) setToken(currentToken);
    }, 500); // نصف ثانية
    return () => clearInterval(interval);
  }, [token]);

  return (
    <AuthContext.Provider value={{ token, setToken }}>
      {children}
    </AuthContext.Provider>
  );
};
