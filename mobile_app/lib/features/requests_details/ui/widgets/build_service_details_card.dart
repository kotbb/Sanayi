import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_details_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

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
            LocaleKeys.craftmanHome_bookingDetails_requestDetails.tr(),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  requestDetails['serviceType'],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                verticalSpace(10),
                Text(
                  requestDetails['serviceDescription'],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                verticalSpace(16),
                Divider(),
                verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildDetailsItem(
                      icon: Icons.access_time,
                      title: LocaleKeys
                          .craftmanHome_bookingDetails_estimatedTime
                          .tr(),
                      value: requestDetails['estimatedTime'],
                    ),
                    BuildDetailsItem(
                      icon: Icons.attach_money,
                      title: LocaleKeys
                          .craftmanHome_bookingDetails_estimatedcost
                          .tr(),
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
