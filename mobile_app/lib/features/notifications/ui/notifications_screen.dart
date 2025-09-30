import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/features/notifications/ui/widgets/notifications_card_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.notifications.tr()),
        elevation: 0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: NotificationsCardItem(
                title: 'New Notification',
                subtitle: 'You have a new message.',
                timeAgo: '2h ago',
              ),
            );
          },
        ),
      ),
    );
  }
}
