import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/settings/ui/widgets/log_out_bottom_sheet.dart';
import 'package:sanayi_app/features/settings/ui/widgets/list_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Edit", style: TextStyle(fontSize: 18.sp)),
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
                        title: "Edit Profile",
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
                        title: "Change Phone Number",
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.oldNumberScreen);
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(33),
                Text("General", style: TextStyle(fontSize: 18.sp)),
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
                        title: "Notifications",
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {},
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.language),
                        title: "Language",
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.languageScreen);
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.sunny),
                        title: "Mode",
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                verticalSpace(33),
                Text("About Us", style: TextStyle(fontSize: 18.sp)),
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
                        ), //TODO: Change the Icon
                        title: "Who Are We",
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.whoAreWeScreen);
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.wechat_outlined),
                        title: "Contact Us",
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.contactUsScreen);
                        },
                      ),
                      ListTileWidget(
                        leading: Icon(Icons.policy_outlined),
                        title: "Privacy & Policies",
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
                Text("My Account", style: TextStyle(fontSize: 18.sp)),
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
                        title: "LogOut",
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
                        title: "Delete Account",
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
