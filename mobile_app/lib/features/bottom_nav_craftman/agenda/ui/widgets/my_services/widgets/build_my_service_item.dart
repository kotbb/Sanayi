import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class BuildMyServiceItem extends StatelessWidget {
  Map<String, dynamic> service;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;

  BuildMyServiceItem({
    super.key,
    required this.service,
    required this.titleController,
    required this.descriptionController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  service['title'],
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: 18.sp),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 24,
                                    right: 24,
                                    top: 16,
                                    bottom:
                                        MediaQuery.of(
                                          context,
                                        ).viewInsets.bottom +
                                        16,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 50.w,
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                      verticalSpace(16),
                                      Text(
                                        "${LocaleKeys.agenda_edit.tr()} ${service['title']} ${LocaleKeys.agenda_myServices_service.tr()}",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineLarge,
                                      ),
                                      verticalSpace(12),
                                      TextField(
                                        controller: titleController,
                                        decoration: InputDecoration(
                                          labelText: LocaleKeys
                                              .agenda_myServices_serviceTitle
                                              .tr(),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      verticalSpace(12),
                                      TextField(
                                        controller: descriptionController,
                                        decoration: InputDecoration(
                                          labelText: LocaleKeys
                                              .agenda_myServices_category
                                              .tr(),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      verticalSpace(12),
                                      TextField(
                                        controller: descriptionController,
                                        decoration: InputDecoration(
                                          labelText: LocaleKeys
                                              .agenda_myServices_price
                                              .tr(),
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      verticalSpace(12),
                                      TextField(
                                        controller: descriptionController,
                                        decoration: InputDecoration(
                                          labelText: LocaleKeys
                                              .agenda_myServices_description
                                              .tr(),
                                          border: OutlineInputBorder(),
                                        ),
                                        maxLines: 3,
                                      ),
                                      verticalSpace(24),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(
                                            double.infinity,
                                            50.h,
                                          ),
                                          backgroundColor:
                                              ColorsManager.mainBlue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8.r,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          // todo: handle save
                                        },
                                        child: Text(
                                          LocaleKeys.agenda_workSchedule_saveBtn
                                              .tr(),
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
                    IconButton(
                      icon: Icon(Icons.delete, size: 18.sp, color: Colors.red),
                      onPressed: () {
                        // Delete service functionality
                      },
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(8),
            Text(
              service['description'],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalSpace(8),
            Row(
              children: [
                Chip(
                  label: Text(
                    service['category'],
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  backgroundColor: Colors.blue[100],
                ),
                horizontalSpace(6),
                horizontalSpace(6),
                Icon(Icons.attach_money, size: 16, color: Colors.green),
                horizontalSpace(2),
                Text(
                  service['price'],
                  style: TextStyle(fontSize: 12.sp, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
