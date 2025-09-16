import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/work_schedule/widgets/build_day_schedule_item.dart';

class WorkScheduleTab extends StatelessWidget {
  WorkScheduleTab({super.key});

  final List<Map<String, dynamic>> workSchedule = [
    {'day': 'Saturday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': true},
    {'day': 'Sunday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': true},
    {'day': 'Monday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': true},
    {'day': 'Tuesday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': true},
    {'day': 'Wednesday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': true},
    {'day': 'Thursday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': true},
    {'day': 'Friday', 'from': '9:00 AM', 'to': '5:00 PM', 'active': false},
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
                    leading: Icon(
                      Icons.access_time,
                      color: const Color(0xff102144),
                    ),
                    title: Text(
                      'Weekly Work Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    subtitle: Text('Set your available working hours'),
                  ),
                  Divider(),
                  ...workSchedule.map(
                    (daySchedule) =>
                        BuildDayScheduleItem(daySchedule: daySchedule),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(22),
          ElevatedButton.icon(
            onPressed: () {
              // Save schedule functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Work schedule saved successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            icon: Icon(Icons.save),
            label: Text('Save Schedule'),
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
