import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class SuccessBookingScreen extends StatelessWidget {
  const SuccessBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/animations/done.json",
                width: 200.w,
                height: 174.h,
              ),
              verticalSpace(23),
              Text(
                LocaleKeys.clientHome_successBooking.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              verticalSpace(17),
              Text(
                textAlign: TextAlign.center,
                LocaleKeys.clientHome_bodySuccessBooking.tr(),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
              ),
              verticalSpace(50),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.appLayout);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48.h),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    side: BorderSide(color: ColorsManager.mainBlue, width: 1.w),
                  ),
                ),
                child: Text(
                  LocaleKeys.resrvation_bookingDetails_cancelBtmSheet_successCancel_doneBtn.tr(),
                  style: TextStyle(color: ColorsManager.mainBlue, fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
