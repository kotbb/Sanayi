import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/settings/ui/contact_us/widgets/icon_and_title_widget.dart';
import 'package:sanayi_app/features/settings/ui/contact_us/widgets/response_details_widget.dart';
import 'package:sanayi_app/features/settings/ui/contact_us/widgets/whats_app_card.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            IconAndTitleWidget(),
            verticalSpace(40),
            WhatsAppCard(),
            verticalSpace(32),
            ResponseDetailsWidget(),
            verticalSpace(20),
            Text(
              'For quick assistance, WhatsApp is the fastest way to reach us. '
              'We\'re happy to help with any questions or concerns you may have.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                height: 1.5.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
