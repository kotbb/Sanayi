import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ClientReviewWidget extends StatelessWidget {
  const ClientReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.clientHome_clientReview.tr(), style: Theme.of(context).textTheme.labelLarge),
        verticalSpace(12),
        Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
            ),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Feras AbuZayed",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                verticalSpace(4),
                Row(
                  children: [
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star, size: 18, color: Colors.orangeAccent),
                    Icon(Icons.star_half, size: 18, color: Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ],
        ),
        verticalSpace(12),
        Text(
          "The craftsman was professional and delivered the work on time. "
          "Very satisfied with the results!",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
