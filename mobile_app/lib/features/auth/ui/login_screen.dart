import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                child: SvgPicture.asset(
                  "assets/images/svg/login.svg",
                  width: 150.w,
                  height: 150.h,
                ),
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.login_body.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  verticalSpace(16),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.login_hintText.tr(),
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          horizontalSpace(16),
                          Text(
                            "+970",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          horizontalSpace(8),
                          Container(
                            width: 1.w,
                            height: 24.h,
                            color: Colors.grey.shade400,
                          ),
                          horizontalSpace(8),
                        ],
                      ),
                      filled: true,
                      fillColor: ColorsManager.seconderyLightGreen,
                      contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: BorderSide.none,
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
                        Navigator.pushNamed(context, Routes.otpCodeScreen);
                      },
                      child: Text(
                        LocaleKeys.continueBtn.tr(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(12),
                  Center(
                    child: Text(
                      LocaleKeys.login_subTxt.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
