import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/my_services/widgets/build_my_service_item.dart';

class MyServicesTab extends StatelessWidget {
  MyServicesTab({super.key});

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Electrical Installations',
      'description':
          'Installation and repair of electrical cables for buildings',
      'price': 'Start from 200 NIS',
      'duration': '2-4h',
      'category': 'Electrical',
    },
    {
      'title': 'Plumbing Services',
      'description': 'Installation and repair of water pipes and fixtures',
      'price': 'Start from 150 NIS',
      'duration': '1-3h',
      'category': 'Plumbing',
    },
    {
      'title': 'Maintenance Services',
      'description': 'General maintenance and repair services',
      'price': 'Start from 100 NIS',
      'duration': '1-2h',
      'category': 'Maintenance',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.build, color: const Color(0xff102144)),
                    title: Text(
                      'My Services',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    subtitle: Text('Manage your offered services'),
                  ),
                  Divider(),
                  ...services.map(
                    (service) => BuildMyServiceItem(service: service),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(22),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('Add New Service'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff102144),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            ),
          ),
        ],
      ),
    );
  }
}
