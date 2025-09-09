import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/ui/widgets/reservation_item_widget.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: ReservationItemWidget(
                image: '',
                title: 'Reservation',
                subTitle: 'Reservation Details',
                onTap: () {
                  //TODO: Navigate to reservation details from ReservationItemWidget
                  Navigator.pushNamed(context, Routes.bookingDetailsScreen);
                },
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
