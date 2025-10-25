import { createContext, useState } from "react";
export const login=createContext({});

export default function ShowLogin({children}){
    const [showLogin,setShowLogin]=useState(false);
    return <login.Provider value={{showLogin,setShowLogin}}>{children}</login.Provider>
}

