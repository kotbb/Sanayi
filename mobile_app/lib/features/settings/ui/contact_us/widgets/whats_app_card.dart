import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppCard extends StatelessWidget {
  const WhatsAppCard({super.key});

  final String whatsappNumber = '+970599244809';
  final String whatsappLink = 'https://wa.me/970599244809';

  Future<void> _launchWhatsApp(BuildContext context) async {
    final url = 'https://wa.me/$whatsappNumber';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open WhatsApp'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wechat_sharp, color: Colors.green, size: 28),
                horizontalSpace(10),
                Text(
                  LocaleKeys.profile_settings_contactUs_whatsCardTxt.tr(),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            verticalSpace(16),
            Text(
              LocaleKeys.profile_settings_contactUs_whatsCardBody.tr(),
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            verticalSpace(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _launchWhatsApp(context),
                icon: Icon(Icons.chat, size: 24),
                label: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    LocaleKeys.profile_settings_contactUs_openWhatsBtn.tr(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
