const express = require("express");
const authController = require("../controllers/authController");
const router = express.Router();

router.route("/login").post(authController.login);
router.route("/login/admin").post(authController.loginAdmin);

router.post("/check-user-exists", authController.checkUserExists);

router.route("/register/send-otp").post(authController.sendRegisterOTP);
router.route("/register/verify-otp").post(authController.verifyRegisterOTP);
router.route("/register/complete").post(authController.completeRegister);

module.exports = router;
