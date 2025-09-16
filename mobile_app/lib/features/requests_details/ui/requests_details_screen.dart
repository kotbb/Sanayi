import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/action_btns.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_booking_info_card.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_client_info_card.dart';
import 'package:sanayi_app/features/requests_details/ui/widgets/build_service_details_card.dart';

class RequestsDetailsScreen extends StatelessWidget {
  RequestsDetailsScreen({super.key});

  final Map<String, dynamic> requestDetails = {
    'clientName': 'Mohammed Hameed',
    'phone': '059XXXXXXX',
    'address': 'Gaza - Al Wahda Street',
    'serviceType': 'Home Electrical',
    'serviceDescription': 'I need electrical installation for my new home',
    'requestNumber': '#1003',
    'date': '5/8/2025',
    'time': '10:30 AM',
    'status': 'Pending',
    'estimatedTime': '2-3 hours',
    'estimatedCost': '250-300 NIS',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Request status
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getStatusColor(requestDetails['status']),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info, color: Colors.white),
                  horizontalSpace(8),
                  Text(
                    requestDetails['status'],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(22),

            // Client information
            BuildClientInfoCard(requestDetails: requestDetails),
            verticalSpace(22),

            // Service details
            BuildServiceDetailsCard(requestDetails: requestDetails),
            verticalSpace(22),

            // Booking information
            BuildBookingInfoCard(requestDetails: requestDetails),
            verticalSpace(32),

            // Action buttons
            ActionBtns(),
            verticalSpace(22),

            // Additional options
            Center(
              child: TextButton(
                onPressed: () {
                  // Add notes or additional details
                },
                child: Text(
                  'Add Notes to Request',
                  style: TextStyle(
                    color: const Color(0xff102144),
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange;
      case 'Accepted':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      case 'Completed':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
