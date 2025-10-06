import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BuildDayScheduleItem extends StatelessWidget {
  Map<String, dynamic> daySchedule;

  BuildDayScheduleItem({super.key, required this.daySchedule});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        daySchedule['day'],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: daySchedule['active'] ? Colors.grey[800] : Colors.grey[400],
        ),
      ),
      subtitle: Text(
        daySchedule['active']
            ? '${daySchedule['from']} - ${daySchedule['to']}'
            : 'Not working',
        style: TextStyle(
          color: daySchedule['active'] ? Colors.grey[600] : Colors.grey[400],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(value: daySchedule['active'], onChanged: (value) {}),
          IconButton(
            icon: Icon(Icons.edit, size: 20),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.r),
                  ),
                ),
                builder: (context) {
                  TimeOfDay? startTime;
                  TimeOfDay? endTime;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 50.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                            verticalSpace(16),
                            Text(
                              "${LocaleKeys.agenda_edit.tr()} ${daySchedule['day']} ${LocaleKeys.agenda_workSchedule_schedule.tr()}",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            verticalSpace(12),

                            // Active switch
                            SwitchListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                LocaleKeys.agenda_workSchedule_active.tr(),
                              ),
                              value: daySchedule['active'],
                              onChanged: (value) {
                                setState(() {
                                  daySchedule['active'] = value;
                                });
                              },
                            ),

                            verticalSpace(12),
                            Text(
                              LocaleKeys.agenda_workSchedule_setWorkHours.tr(),
                              style: TextStyle(fontSize: 14.sp),
                            ),

                            verticalSpace(12),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      final picked = await showTimePicker(
                                        context: context,
                                        initialTime:
                                            startTime ?? TimeOfDay.now(),
                                      );
                                      if (picked != null) {
                                        setState(() => startTime = picked);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14.h,
                                        horizontal: 12.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                      child: Text(
                                        startTime != null
                                            ? startTime!.format(context)
                                            : LocaleKeys
                                                  .agenda_workSchedule_startTime
                                                  .tr(),
                                      ),
                                    ),
                                  ),
                                ),
                                horizontalSpace(12),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      final picked = await showTimePicker(
                                        context: context,
                                        initialTime: endTime ?? TimeOfDay.now(),
                                      );
                                      if (picked != null) {
                                        setState(() => endTime = picked);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 14.h,
                                        horizontal: 12.w,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                        ),
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        endTime != null
                                            ? endTime!.format(context)
                                            : LocaleKeys
                                                  .agenda_workSchedule_endTime
                                                  .tr(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            verticalSpace(24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50.h),
                                backgroundColor: ColorsManager.mainBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {
                                // todo: handle save
                                Navigator.pop(context, {
                                  LocaleKeys.agenda_workSchedule_active.tr():
                                      daySchedule['active'],
                                  LocaleKeys.agenda_workSchedule_startTime.tr():
                                      startTime,
                                  LocaleKeys.agenda_workSchedule_endTime.tr():
                                      endTime,
                                });
                              },
                              child: Text(
                                LocaleKeys.agenda_workSchedule_saveBtn.tr(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
