import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_booking_info_item.dart';

class BuildBookingInfoCard extends StatelessWidget {
  Map<String, dynamic> requestDetails;
  
  BuildBookingInfoCard({
    super.key,
    required this.requestDetails,
  });

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildBookingInfoItem(
                  title: 'Request Number',
                  value: requestDetails['requestNumber'],
                  icon: Icons.confirmation_number,
                ),
                BuildBookingInfoItem(
                  title: 'Date',
                  value: requestDetails['date'],
                  icon: Icons.calendar_today,
                ),
                BuildBookingInfoItem(
                  title: 'Time',
                  value: requestDetails['time'],
                  icon: Icons.access_time,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
