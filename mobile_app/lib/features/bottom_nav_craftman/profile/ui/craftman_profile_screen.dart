import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/bottom_nav/profile/ui/widgets/account_data_widget.dart';

class CraftmanProfileScreen extends StatelessWidget {
  const CraftmanProfileScreen({super.key});

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
                color: Color(0xfffebf0f4),
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
                      Navigator.pushNamed(context, Routes.settingsScreen);
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                  verticalSpace(24),
                  AccountDataWidget(label: "Profession", value: "Cleaner"),
                  verticalSpace(24),
                  AccountDataWidget(
                    label: "biography",
                    value:
                        ".................................................................................",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
