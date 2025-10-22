import { createContext, useState } from "react";

export const themModeContext=createContext()
export  function ThemModeProvider({children}){
    const [darkMode,setDarkMode]=useState(false)
return <themModeContext.Provider value={{setDarkMode,darkMode}}>{children}</themModeContext.Provider>
}