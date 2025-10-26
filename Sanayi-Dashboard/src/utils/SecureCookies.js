// utils/SecureCookies.js
import CryptoJS from "crypto-js";
import Cookies from "js-cookie";

// مفتاح تشفير سري (قم بتغييره لشيء فريد)
const SECRET_KEY = "my_super_secret_key_2025";

// ===============================
// 🔒 دوال التشفير وفك التشفير
// ===============================

// تشفير قيمة قبل الحفظ في الكوكيز
export function setEncryptedCookie(name, value, days = 7) {
  if (!value) return;
  try {
    const encryptedValue = CryptoJS.AES.encrypt(value, SECRET_KEY).toString();
    Cookies.set(name, encryptedValue, { expires: days, secure: true });
  } catch (error) {
    console.error("❌ Error encrypting cookie:", error);
  }
}

// فك تشفير الكوكيز عند قراءتها
export function getEncryptedCookie(name) {
  const encryptedValue = Cookies.get(name);
  if (!encryptedValue) return null;
  try {
    const bytes = CryptoJS.AES.decrypt(encryptedValue, SECRET_KEY);
    const decryptedValue = bytes.toString(CryptoJS.enc.Utf8);
    return decryptedValue || null;
  } catch (error) {
    console.error("❌ Error decrypting cookie:", error);
    return null;
  }
}

// ===============================
// 🧩 دوال التوكنات الجاهزة
// ===============================

// استرجاع جميع التوكنات من الكوكيز (مشفرة)
export function getTokens() {
  const token = getEncryptedCookie("token");
  const refreshToken = getEncryptedCookie("refreshToken");
  return { token, refreshToken };
}

// حفظ التوكنات في الكوكيز (مشفرة)
export function saveTokens(token, refreshToken) {
  setEncryptedCookie("token", token);
  setEncryptedCookie("refreshToken", refreshToken);
}

// حذف التوكنات من الكوكيز (تسجيل خروج)
export function removeTokens() {
  Cookies.remove("token");
  Cookies.remove("refreshToken");
}

// 🔄 تجديد مفتاح التشفير (اختياري - لو حبيت تغيّر المفتاح ديناميكياً)
export function regenerateKey(newKey) {
  if (newKey) {
    console.warn("⚠️ Changing encryption key dynamically may invalidate old cookies.");
    SECRET_KEY = newKey;
  }
}
