import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/choose_user_type/widgets/build_animated_choose_card.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ChooseUserTypeScreen extends StatelessWidget {
  const ChooseUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.userType_title.tr(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff102144),
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),
              Text(
                LocaleKeys.userType_body.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                  height: 1.4.h,
                ),
              ),
              verticalSpace(48),

              // Expanded row to take space
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 220.h,
                      child: BuildAnimatedChooseCard(
                        title: LocaleKeys.userType_clientCardTitle.tr(),
                        description: LocaleKeys.userType_clientCardBody.tr(),
                        image: Image.asset(
                          "assets/images/user.png",
                          width: 90.w,
                          height: 90.h,
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.createAccountClient,
                          );
                        },
                      ),
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                    child: SizedBox(
                      height: 220.h,
                      child: BuildAnimatedChooseCard(
                        title: LocaleKeys.userType_craftmanCardTitle.tr(),
                        description: LocaleKeys.userType_craftmanCardBody.tr(),
                        image: SvgPicture.asset(
                          "assets/images/svg/on_boarding1.svg",
                          width: 90.w,
                          height: 90.h,
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.createAccountCraftmanScreen,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(32),
              Text(
                LocaleKeys.userType_subTxt.tr(),
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }
}
