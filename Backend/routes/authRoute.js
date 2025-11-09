import express from "express";
import authController from "../controllers/authController.js";
import protect from "../middlewares/auth/protect.js";
import { loginLimiter } from "../middlewares/rateLimiter.js";
const router = express.Router();

router.route("/login").post(loginLimiter, authController.login);
router.route("/login/admin").post(loginLimiter, authController.loginAdmin);
router.route("/logout").post(protect, authController.logout);

router.route("/register/send-otp").post(authController.sendRegisterOTP);
router.route("/register/verify-otp").post(authController.verifyRegisterOTP);
router.route("/register/complete").post(authController.completeRegister);

router.route("/refresh-token").post(authController.getNewRefreshAccessTokens);

export default router;
