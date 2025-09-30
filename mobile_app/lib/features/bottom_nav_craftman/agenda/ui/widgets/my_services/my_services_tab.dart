import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/agenda/ui/widgets/my_services/widgets/build_my_service_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class MyServicesTab extends StatelessWidget {
  MyServicesTab({super.key});

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Electrical Installations',
      'description':
          'Installation and repair of electrical cables for buildings',
      'price': 'Start from 200 NIS',
      'category': 'Electrical',
    },
    {
      'title': 'Plumbing Services',
      'description': 'Installation and repair of water pipes and fixtures',
      'price': 'Start from 150 NIS',
      'category': 'Plumbing',
    },
    {
      'title': 'Maintenance Services',
      'description': 'General maintenance and repair services',
      'price': 'Start from 100 NIS',
      'category': 'Maintenance',
    },
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

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
                      LocaleKeys.agenda_myServices_tabName.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    subtitle: Text(LocaleKeys.agenda_myServices_subTitle.tr()),
                  ),
                  Divider(),
                  ...services.map(
                    (service) => BuildMyServiceItem(
                      service: service,
                      titleController: titleController,
                      descriptionController: descriptionController,
                      priceController: priceController,
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(22),
          ElevatedButton.icon(
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
                              LocaleKeys.agenda_myServices_addNew.tr(),
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            verticalSpace(12),
                            TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.agenda_myServices_serviceTitle.tr(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            verticalSpace(12),
                            TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.agenda_myServices_category.tr(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            verticalSpace(12),
                            TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.agenda_myServices_price.tr(),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            verticalSpace(12),
                            TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                labelText: LocaleKeys.agenda_myServices_description.tr(),
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                            verticalSpace(24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50.h),
                                backgroundColor: const Color(0xff102144),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {
                                // todo: handle add
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(LocaleKeys.agenda_myServices_snackBarTxt.tr()),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              child: Text(
                                LocaleKeys.agenda_myServices_addBtn.tr(),
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
            icon: Icon(Icons.add),
            label: Text(LocaleKeys.agenda_myServices_addNew.tr()),
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
