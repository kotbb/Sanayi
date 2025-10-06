import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/settings/ui/widgets/log_out_bottom_sheet.dart';
import 'package:sanayi_app/features/settings/ui/widgets/list_tile_widget.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          LocaleKeys.profile_settings_title.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.agenda_edit.tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                verticalSpace(14),
                Container(
                  width: double.infinity,
                  height: 124.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTileWidget(
                        leading: Icon(Icons.edit),
                        title: LocaleKeys.profile_settings_editProfile.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.editProfileScreen,
                          );
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.phone),
                        title: LocaleKeys.profile_settings_changeNum.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          //todo
                          Navigator.pushNamed(context, Routes.oldOtpScreen);
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(33),
                Text(
                  LocaleKeys.profile_settings_general.tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                verticalSpace(14),
                Container(
                  width: double.infinity,
                  height: 174.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTileWidget(
                        leading: Icon(Icons.notifications),
                        title: LocaleKeys.profile_settings_notifications.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {},
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.language),
                        title: LocaleKeys.profile_settings_lang.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.languageScreen);
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.sunny),
                        title: LocaleKeys.profile_settings_mode.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                verticalSpace(33),
                Text(
                  LocaleKeys.profile_settings_aboutUs.tr(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                verticalSpace(14),
                Container(
                  width: double.infinity,
                  height: 174.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTileWidget(
                        leading: Icon(
                          Icons.attachment_rounded,
                        ), //todo: Change the Icon
                        title: LocaleKeys.profile_settings_whoAreWe_title.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.whoAreWeScreen);
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.wechat_outlined),
                        title: LocaleKeys.profile_settings_contactUs_title.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.contactUsScreen);
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.policy_outlined),
                        title: LocaleKeys
                            .profile_settings_privacyAndPolicy_title
                            .tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.privacyAndPoliciesScreen,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(33),
                Text(
                  LocaleKeys.profile_settings_myAccount.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                verticalSpace(14),
                Container(
                  width: double.infinity,
                  height: 114.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTileWidget(
                        leading: SvgPicture.asset(
                          "assets/images/svg/logout.svg",
                        ),
                        title: LocaleKeys.profile_settings_logOut_title.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            builder: (context) {
                              return LogOutBottomSheet();
                            },
                          );
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.delete, color: Colors.red),
                        title: LocaleKeys.profile_settings_delete_title.tr(),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
