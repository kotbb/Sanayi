import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/features/see_craftman_profile/ui/widgets/build_info_tile.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class SeeCraftmanProfileScreen extends StatelessWidget {
  const SeeCraftmanProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 70.r,
                backgroundImage: NetworkImage(
                  'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
                ),
              ),
            ),
            verticalSpace(24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  BuildInfoTile(
                    icon: Icons.person,
                    label: LocaleKeys.createAccount_nameHint.tr(),
                    value: "Feras AbuZayed",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.phone,
                    label: LocaleKeys.createAccount_phoneHint.tr(),
                    value: "+970591234567",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.location_on,
                    label: LocaleKeys.createAccount_locationHint.tr(),
                    value: "Gaza - AzZawayda",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.work,
                    label: LocaleKeys.createAccount_profession.tr(),
                    value: "Cleaner",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.calendar_today,
                    label: LocaleKeys.clientHome_experience.tr(),
                    value: "3",
                  ),
                ],
              ),
            ),
            verticalSpace(32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.worksGalleryScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.mainBlue,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  "Works Gallery",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
