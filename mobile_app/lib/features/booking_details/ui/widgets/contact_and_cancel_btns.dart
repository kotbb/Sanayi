import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.contactWithCraftmanScreen,
              );
            },
            child: Text(
              "Contact",
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
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
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
                          "Cancel Booking",
                          style: Theme.of(
                            context,
                          ).textTheme.displayLarge?.copyWith(fontSize: 24.sp),
                        ),
                        verticalSpace(16),
                        Text(
                          "Are you sure you want to cancel the booking?",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
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
                            "yes",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        verticalSpace(16),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(double.infinity, 48.h),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "No",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
