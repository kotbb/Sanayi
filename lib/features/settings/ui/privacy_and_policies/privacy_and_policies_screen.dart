import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/settings/ui/privacy_and_policies/widgets/build_policy_section.dart';
import 'package:sanayi_app/features/settings/ui/privacy_and_policies/widgets/privacy_icon_widget.dart';
import 'package:sanayi_app/features/settings/ui/privacy_and_policies/widgets/title_and_last_update_widget.dart';

class PrivacyAndPoliciesScreen extends StatelessWidget {
  const PrivacyAndPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Privacy & Policies',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            PrivacyIconWidget(),
            verticalSpace(30),
            TitleAndLastUpdateWidget(),
            verticalSpace(30),
            BuildPolicySection(
              title: '1. Acceptable Use',
              content:
                  'Users may use the "Sanaai" application only for personal and non-commercial purposes, with the aim of searching for craft and maintenance service providers or providing these services. Any illegal, fraudulent, or harmful use aimed at harassing service providers or users is strictly prohibited.',
            ),

            BuildPolicySection(
              title: '2. Account Suspension',
              content:
                  'If any violation of these terms is discovered, the application administration has the right to suspend or terminate the account without prior notice.',
            ),

            BuildPolicySection(
              title: '3. User Responsibilities',
              content:
                  'Users are responsible for maintaining the confidentiality of their account information and for all activities that occur under their account.',
            ),

            BuildPolicySection(
              title: '4. Content Guidelines',
              content:
                  'Users must not post content that is illegal, offensive, defamatory, infringing, or otherwise inappropriate. The administration reserves the right to remove any content that violates these guidelines.',
            ),

            BuildPolicySection(
              title: '5. Privacy & Data Protection',
              content:
                  'We are committed to protecting your personal information. We collect only necessary data to provide and improve our services, and we do not share your information with third parties without your consent, except as required by law.',
            ),

            BuildPolicySection(
              title: '6. Service Modifications',
              content:
                  'We reserve the right to modify or discontinue any service or feature at any time without prior notice.',
            ),

            BuildPolicySection(
              title: '7. Limitation of Liability',
              content:
                  'The application shall not be liable for any indirect, incidental, special, or consequential damages resulting from the use or inability to use the service.',
            ),
            verticalSpace(30),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: const Color(0xff102144),
                      size: 24,
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Text(
                        'By using our application, you agree to our Terms of Use and Privacy Policy',
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(26),
          ],
        ),
      ),
    );
  }
}
