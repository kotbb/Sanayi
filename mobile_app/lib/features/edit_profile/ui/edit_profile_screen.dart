import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/edit_profile/ui/widgets/Image_widget.dart';
import 'package:sanayi_app/features/edit_profile/ui/widgets/change_data_widget.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffebf0f4),
        title: Text(LocaleKeys.profile_settings_editProfile.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWidget(onTap: () {}, networkImageUrl: null),
              verticalSpace(24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: make controllers for text fields
                    ChangeDataWidget(label: LocaleKeys.profile_nameLabel.tr()),
                    verticalSpace(24),
                    ChangeDataWidget(label: LocaleKeys.profile_locationLabel.tr()),
                    verticalSpace(24),
                    ChangeDataWidget(label: LocaleKeys.profile_bioLabel.tr()),
                    verticalSpace(40),
                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //Todo
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.settingsScreen,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          backgroundColor: const Color(0xff102144),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          LocaleKeys.agenda_edit.tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
