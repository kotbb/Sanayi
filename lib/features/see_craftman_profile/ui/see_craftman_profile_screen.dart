import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/see_craftman_profile/ui/widgets/build_info_tile.dart';

class SeeCraftmanProfileScreen extends StatelessWidget {
  const SeeCraftmanProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "CraftMan Profile",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  BuildInfoTile(
                    icon: Icons.person,
                    label: "Name",
                    value: "Feras AbuZayed",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.phone,
                    label: "Phone",
                    value: "+970591234567",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.location_on,
                    label: "Location",
                    value: "Gaza - AzZawayda",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.work,
                    label: "Profession",
                    value: "Cleaner",
                  ),
                  const Divider(height: 0),
                  BuildInfoTile(
                    icon: Icons.calendar_today,
                    label: "Experience (Years)",
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
                  Navigator.pushNamed(
                    context,
                    Routes.worksGalleryScreen,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff102144),
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
