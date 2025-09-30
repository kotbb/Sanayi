import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/contact_with_craftman/ui/widgets/whatsapp_number_card.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ContactWithCraftmanScreen extends StatelessWidget {
  const ContactWithCraftmanScreen({super.key});

  //todo : move this to the cubit
  final String whatsappNumber = '+970595974716';
  final String name = 'Feras AbuZayed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.resrvation_bookingDetails_contactScreen_title.tr(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
              ),
            ),
            verticalSpace(30),
            Text(
              name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff102144),
              ),
            ),
            verticalSpace(10),
            Text(
              'Mobile App Developer',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
            ),
            verticalSpace(40),
            WhatsappNumberCard(whatsappNumber: whatsappNumber),
            verticalSpace(30),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.access_time, color: Color(0xff102144)),
                    title: Text(LocaleKeys.resrvation_bookingDetails_contactScreen_workingHours.tr()),
                    subtitle: Text('8:00 AM - 6:00 PM'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Color(0xff102144)),
                    title: Text(LocaleKeys.resrvation_bookingDetails_location.tr()),
                    subtitle: Text('Gaza - AzZawayda'),
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            Text(
              LocaleKeys.resrvation_bookingDetails_contactScreen_subText.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
                height: 1.5.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
