import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BuildInProgressCard extends StatelessWidget {
  Map<String, dynamic> request;
  
  BuildInProgressCard({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              request['name'],
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            verticalSpace(8),
            Text(
              request['service'],
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
            ),
            verticalSpace(8),
            LinearProgressIndicator(
              value: request['progress'] / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                const Color(0xff102144),
              ),
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${request['progress']}% ${LocaleKeys.craftmanHome_completed.tr()}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff102144),
                  ),
                ),
                Text(
                  request['date'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
