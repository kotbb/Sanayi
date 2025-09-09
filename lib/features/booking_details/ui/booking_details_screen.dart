import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/booking_details/ui/widgets/build_info_card.dart';
import 'package:sanayi_app/features/booking_details/ui/widgets/contact_and_cancel_btns.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Booking Details"),
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
              label: "Locaiton",
              value: "Gaza - AzZawayda",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.calendar_today,
              label: "Date",
              value: "15/9/2025",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.access_time,
              label: "Time",
              value: "7:23 PM",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.notes,
              label: "Notes",
              value: "Please bring required tools and materials.",
            ),
            verticalSpace(12),
            BuildInfoCard(
              icon: Icons.info_outline,
              label: "Status",
              value: "Pending",
            ),
            verticalSpace(24),
            ContactAndCancelBtns(),
            verticalSpace(12),
          ],
        ),
      ),
    );
  }
}
