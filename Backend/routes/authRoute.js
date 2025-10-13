const express = require("express");
const authController = require("../controllers/authController");
const router = express.Router();

router.route("/login").post(authController.loginLimiter, authController.login);
router.route("/login/admin").post(authController.loginLimiter, authController.loginAdmin);
router.route("/logout").post(authController.protect, authController.logout);

router.route("/register/send-otp").post(authController.sendRegisterOTP);
router.route("/register/verify-otp").post(authController.verifyRegisterOTP);
router.route("/register/complete").post(authController.completeRegister);

router.route("/refresh-token").post(authController.getNewRefreshAccessTokens);

module.exports = router;
