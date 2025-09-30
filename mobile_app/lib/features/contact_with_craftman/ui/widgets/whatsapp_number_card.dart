import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sanayi_app/core/helpers/spacing.dart';

class WhatsappNumberCard extends StatelessWidget {
  String whatsappNumber;
  
  WhatsappNumberCard({
    super.key,
    required this.whatsappNumber,
  });

    //todo : move this to the cubit

  Future<void> _launchWhatsApp(BuildContext context) async {
    final url = 'https://wa.me/$whatsappNumber';
    try {
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch WhatsApp'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Occured: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _copyToClipboard(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: whatsappNumber));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('phone number copied'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.phone, color: Colors.green[700], size: 28),
                horizontalSpace(10),
                Text(
                  LocaleKeys.resrvation_bookingDetails_contactScreen_whatsappNumber.tr(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            Text(
              whatsappNumber,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _launchWhatsApp(context),
                  icon: Icon(Icons.chat, size: 24, color: Colors.white),
                  label: Text(
                    LocaleKeys.resrvation_bookingDetails_contact.tr(),
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => _copyToClipboard(context),
                  icon: Icon(Icons.copy, size: 20),
                  label: Text(LocaleKeys.resrvation_bookingDetails_contactScreen_copy.tr(), style: TextStyle(fontSize: 16.sp)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
