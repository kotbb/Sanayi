import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ActionBtns extends StatelessWidget {
  const ActionBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.check_circle),
            label: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(LocaleKeys.craftmanHome_bookingDetails_acceptBtn.tr(), style: TextStyle(fontSize: 16.sp)),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.cancel),
            label: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(LocaleKeys.craftmanHome_bookingDetails_RejectBtn.tr(), style: TextStyle(fontSize: 16.sp)),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
