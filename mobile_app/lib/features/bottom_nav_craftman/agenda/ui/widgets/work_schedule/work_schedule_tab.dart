import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/work_schedule/widgets/build_day_schedule_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

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
                      LocaleKeys.agenda_workSchedule_title.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    subtitle: Text(LocaleKeys.agenda_workSchedule_subTitle.tr()),
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
                  content: Text(LocaleKeys.agenda_workSchedule_snackBarTxt.tr()),
                  backgroundColor: Colors.green,
                ),
              );
            },
            icon: Icon(Icons.save),
            label: Text(LocaleKeys.agenda_workSchedule_saveScheduleBtn.tr()),
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
