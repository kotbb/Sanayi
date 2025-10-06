import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ContactAndCancelBtns extends StatelessWidget {
  const ContactAndCancelBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.contactWithCraftmanScreen);
            },
            child: Text(
              LocaleKeys.resrvation_bookingDetails_contact.tr(),
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0.r),
                  ),
                ),
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 24.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            width: 64.w,
                            height: 2.h,
                            color: Colors.grey,
                          ),
                        ),
                        verticalSpace(16),
                        Text(
                          LocaleKeys
                              .resrvation_bookingDetails_cancelBtmSheet_title
                              .tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        verticalSpace(16),
                        Text(
                          LocaleKeys
                              .resrvation_bookingDetails_cancelBtmSheet_subTitle
                              .tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          onPressed: () {
                            //todo: handle the cancel booking From Backend
                            Navigator.pushNamed(
                              context,
                              Routes.successCancelBookingScreen,
                            );
                          },
                          child: Text(
                            LocaleKeys
                                .resrvation_bookingDetails_cancelBtmSheet_yesBtn
                                .tr(),
                            style: TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        ),
                        verticalSpace(16),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            LocaleKeys
                                .resrvation_bookingDetails_cancelBtmSheet_noBtn
                                .tr(),
                            style: TextStyle(color: Colors.black, fontSize: 16.sp),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text(
              LocaleKeys.resrvation_bookingDetails_cancel.tr(),
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
