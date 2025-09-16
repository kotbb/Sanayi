import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildClientInfoCard extends StatelessWidget {
  Map<String, dynamic> requestDetails;

  BuildClientInfoCard({super.key, required this.requestDetails});

  void _contactClient(BuildContext context) {
    // Implement client contact
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling client...'),
        backgroundColor: const Color(0xff102144),
      ),
    );
  }

  void _showLocation(
    BuildContext context,
    Map<String, dynamic> requestDetails,
  ) {
    // Show client location on map
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening client location on map...'),
        backgroundColor: const Color(0xff102144),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Clinet Information",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff102144),
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person, color: const Color(0xff102144)),
                  title: Text(
                    requestDetails['clientName'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone, color: const Color(0xff102144)),
                  title: Text(requestDetails['phone']),
                  trailing: IconButton(
                    icon: Icon(Icons.phone, color: Colors.green),
                    onPressed: () => _contactClient(context),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: const Color(0xff102144),
                  ),
                  title: Text(requestDetails['address']),
                  trailing: IconButton(
                    icon: Icon(Icons.map, color: Colors.red),
                    onPressed: () => _showLocation(context, requestDetails),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
