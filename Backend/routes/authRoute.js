const express = require("express");
const authController = require("../controllers/authController");
const router = express.Router();

router.route("/login").post(authController.login);
router.route("/login/admin").post(authController.loginAdmin);

router.route("/register/send-otp").post(authController.sendRegisterOTP);
router.route("/register/verify-otp").post(authController.verifyRegisterOTP);
router.route("/register/complete").post(authController.completeRegister);

router.route("/refresh-token").post(authController.getNewRefreshAccessTokens);

module.exports = router;
