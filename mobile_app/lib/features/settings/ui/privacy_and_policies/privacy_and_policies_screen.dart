import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/features/settings/ui/privacy_and_policies/widgets/build_policy_section.dart';
import 'package:sanayi_app/features/settings/ui/privacy_and_policies/widgets/privacy_icon_widget.dart';
import 'package:sanayi_app/features/settings/ui/privacy_and_policies/widgets/title_and_last_update_widget.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class PrivacyAndPoliciesScreen extends StatelessWidget {
  const PrivacyAndPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          LocaleKeys.profile_settings_privacyAndPolicy_title.tr(),
          style: Theme.of(context).textTheme.titleLarge,
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
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_acceptableTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_acceptableBody
                  .tr(),
            ),

            BuildPolicySection(
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_suspensionTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_suspensionBody
                  .tr(),
            ),

            BuildPolicySection(
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_responsibilitiesTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_responsibilitiesBody
                  .tr(),
            ),

            BuildPolicySection(
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_guidelinesTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_guidelinesBody
                  .tr(),
            ),

            BuildPolicySection(
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_protectionTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_protectionBody
                  .tr(),
            ),

            BuildPolicySection(
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_modificationsTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_modificationsBody
                  .tr(),
            ),

            BuildPolicySection(
              title: LocaleKeys
                  .profile_settings_privacyAndPolicy_limitationTitle
                  .tr(),
              content: LocaleKeys
                  .profile_settings_privacyAndPolicy_limitationBody
                  .tr(),
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
                      color: ColorsManager.mainBlue,
                      size: 24,
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Text(
                        LocaleKeys
                            .profile_settings_privacyAndPolicy_agreePrivacyPolicy
                            .tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
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
