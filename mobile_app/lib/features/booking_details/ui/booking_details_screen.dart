import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/booking_details/ui/widgets/build_info_card.dart';
import 'package:sanayi_app/features/booking_details/ui/widgets/contact_and_cancel_btns.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(LocaleKeys.resrvation_bookingDetails_title.tr()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
              ),
            ),
            verticalSpace(12),
            Text(
              "Feras AbuZayed",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff102144),
              ),
            ),
            verticalSpace(24),
            BuildInfoCard(
              icon: Icons.location_on,
              label: LocaleKeys.resrvation_bookingDetails_location.tr(),
              value: "Gaza - AzZawayda",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.calendar_today,
              label: LocaleKeys.resrvation_bookingDetails_data.tr(),
              value: "15/9/2025",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.access_time,
              label: LocaleKeys.resrvation_bookingDetails_time.tr(),
              value: "7:23 PM",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.notes,
              label: LocaleKeys.resrvation_bookingDetails_notes.tr(),
              value: "Please bring required tools and materials.",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.info_outline,
              label: LocaleKeys.resrvation_bookingDetails_statue.tr(),
              value: "Pending",
            ),
            verticalSpace(24),
            ContactAndCancelBtns(),
            verticalSpace(12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff102144),
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 32.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.rateCraftmanScreen);
              },
              child: Text(
                LocaleKeys.resrvation_bookingDetails_rateCraftman.tr(),
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
