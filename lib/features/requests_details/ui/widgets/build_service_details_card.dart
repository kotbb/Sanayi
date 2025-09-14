import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_details_item.dart';

class BuildServiceDetailsCard extends StatelessWidget {
  Map<String, dynamic> requestDetails;

  BuildServiceDetailsCard({super.key, required this.requestDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Service Details",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff102144),
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  requestDetails['serviceType'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: const Color(0xff102144),
                  ),
                ),
                verticalSpace(10),
                Text(
                  requestDetails['serviceDescription'],
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
                ),
                verticalSpace(16),
                Divider(),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildDetailsItem(
                      icon: Icons.access_time,
                      title: 'Estimated Time',
                      value: requestDetails['estimatedTime'],
                    ),
                    BuildDetailsItem(
                      icon: Icons.attach_money,
                      title: 'Estimated Cost',
                      value: requestDetails['estimatedCost'],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
