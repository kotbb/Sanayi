import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_booking_info_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BuildBookingInfoCard extends StatelessWidget {
  Map<String, dynamic> requestDetails;

  BuildBookingInfoCard({super.key, required this.requestDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            LocaleKeys.craftmanHome_bookingDetails_serviceDetails.tr(),
            style: Theme.of(context).textTheme.labelLarge,
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
                  title: LocaleKeys.craftmanHome_bookingDetails_requestNumber
                      .tr(),
                  value: requestDetails['requestNumber'],
                  icon: Icons.confirmation_number,
                ),
                BuildBookingInfoItem(
                  title: LocaleKeys.craftmanHome_bookingDetails_date.tr(),
                  value: requestDetails['date'],
                  icon: Icons.calendar_today,
                ),
                BuildBookingInfoItem(
                  title: LocaleKeys.craftmanHome_bookingDetails_time.tr(),
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
