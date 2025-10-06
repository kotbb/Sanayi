import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class OtpCodeScreen extends StatelessWidget {
  const OtpCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsManager.seconderyLightGreen),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  color: ColorsManager.seconderyLightGreen,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.r),
                    bottomRight: Radius.circular(100.r),
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
                          LocaleKeys.otp_verificationCode.tr(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "00:00",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    Text(
                      LocaleKeys.otp_body.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
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
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            // color: Color(0xfffEBF0F4),
                            borderRadius: BorderRadius.circular(10.r),
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
                          backgroundColor: ColorsManager.mainBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        onPressed: () {
                          // todo: Handle continue button press
                          Navigator.pushNamed(
                            context,
                            Routes.chooseUserTypeScreen,
                          );
                        },
                        child: Text(
                          LocaleKeys.continueBtn.tr(),
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${LocaleKeys.otp_reciveCode.tr()} ",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.otp_resendbtn.tr(),
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
