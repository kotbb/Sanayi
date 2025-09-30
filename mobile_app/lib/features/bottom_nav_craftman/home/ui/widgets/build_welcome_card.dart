import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BuildWelcomeCard extends StatelessWidget {
  List<Map<String, dynamic>> newRequests;

  BuildWelcomeCard({
    super.key,
    required this.newRequests,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(
                'https://example.com/avatar.jpg',
              ), // Craftsman's image
              backgroundColor: Colors.blue[100],
              child: Icon(
                Icons.person,
                size: 30,
                color: const Color(0xff102144),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${LocaleKeys.craftmanHome_hello.tr()} Feras',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff102144),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.notificationsScreen);
                        },
                      ),
                    ],
                  ),
                  verticalSpace(6),
                  Text(
                    '${LocaleKeys.craftmanHome_bodyPart1.tr()} ${newRequests.length} ${LocaleKeys.craftmanHome_bodyPart2.tr()}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
