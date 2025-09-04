import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav/profile/ui/widgets/account_data_widget.dart';
import 'package:sanayi_app/features/bottom_nav/profile/ui/widgets/log_out_bottom_sheet.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              decoration: const BoxDecoration(
                color: Color(0xfffEBF0F4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   Routes.notificationsScreen,
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.settings,
                            color: const Color(0xff102144),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AccountDataWidget(label: "Name", value: "Feras Abu Zayed"),
                  verticalSpace(24),
                  AccountDataWidget(
                    label: "Phone Number",
                    value: "+97059123456",
                  ),
                  verticalSpace(24),
                  AccountDataWidget(
                    label: "Location",
                    value: "Gaza, AzZawayda",
                  ),
                  verticalSpace(36),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      'assets/images/svg/logout.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: Text(
                      "LogOut",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(double.infinity, 50.h),
                  //     backgroundColor: Color(0xfff102144),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.r),
                  //     ),
                  //   ),
                  //   child: Text(
                  //     "LogOut",
                  //     style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
