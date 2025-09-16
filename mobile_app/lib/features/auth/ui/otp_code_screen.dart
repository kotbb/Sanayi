import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xfffEBF0F4)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: const BoxDecoration(
                  color: Color(0xfffEBF0F4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/sms.png",
                    width: 200.w,
                    height: 200.h,
                  ),
                ),
              ),
              verticalSpace(40),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Verification Code",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "00:00",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff102144),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Text(
                      "Enter the code sent to your phone number",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    verticalSpace(22),
                    Center(
                      child: Pinput(
                        length: 4,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        separatorBuilder: (index) => SizedBox(width: 16.w),
                        defaultPinTheme: PinTheme(
                          width: 60.w,
                          height: 60.h,
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xff102144),
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            // color: Color(0xfffEBF0F4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(36),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff102144),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // TODO: Handle continue button press
                          Navigator.pushNamed(
                            context,
                            Routes.chooseUserTypeScreen,
                          );
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  color: const Color(0xff102144),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
