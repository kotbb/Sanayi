import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/booking_craftman/ui/widgets/build_section_widget.dart';

class BookingCraftmanScreen extends StatelessWidget {
  const BookingCraftmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booking Craftman')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildSectionWidget(
              icon: Icons.calendar_today,
              title: 'Date',
              content: "25/9/2025",
              onTap: () {},
            ),
            verticalSpace(24),
            BuildSectionWidget(
              icon: Icons.access_time,
              title: 'Time',
              content: "10:00 AM",
              onTap: () {},
            ),
            verticalSpace(24),
            BuildSectionWidget(
              icon: Icons.location_on,
              title: 'Location',
              content: "Gaza, Azzwayda",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Location'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(title: Text('Gaza Victory'), onTap: () {}),
                          ListTile(title: Text('Gaza Center'), onTap: () {}),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            verticalSpace(24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notes, color: Color(0xff102144)),
                      SizedBox(width: 12),
                      Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff102144),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  TextField(
                    onChanged: (value) {},
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter any additional notes...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xff102144)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            verticalSpace(32),
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: ElevatedButton(
                onPressed: () {
                  //todo: Handle booking logic here
                  Navigator.pushNamed(context, Routes.successBookingScreen);
                  final snackBar = SnackBar(
                    content: Text('Appointment booked successfully!'),
                    backgroundColor: Color(0xff102144),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff102144),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
