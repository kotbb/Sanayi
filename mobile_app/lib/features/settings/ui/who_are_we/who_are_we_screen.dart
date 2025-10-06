import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/features/settings/ui/who_are_we/widgets/build_state_item.dart';
import 'package:sanayi_app/features/settings/ui/who_are_we/widgets/build_value_item.dart';
import 'package:sanayi_app/features/settings/ui/who_are_we/widgets/who_are_we_card.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class WhoAreWeScreen extends StatelessWidget {
  const WhoAreWeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.profile_settings_whoAreWe_title.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.group,
                  size: 60,
                  color: ColorsManager.mainBlue,
                ),
              ),
            ),
            verticalSpace(30),
            WhoAreWeCard(),
            verticalSpace(26),
            Text(
              LocaleKeys.profile_settings_whoAreWe_ourValues.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            verticalSpace(16),
            BuildValueItem(
              icon: Icons.verified_user,
              title: LocaleKeys.profile_settings_whoAreWe_qualityAndExcellence
                  .tr(),
              description: LocaleKeys.profile_settings_whoAreWe_qualityTxt.tr(),
            ),
            BuildValueItem(
              icon: Icons.accessibility,
              title: LocaleKeys.profile_settings_whoAreWe_reliability.tr(),
              description: LocaleKeys.profile_settings_whoAreWe_reliabilityTxt
                  .tr(),
            ),
            BuildValueItem(
              icon: Icons.thumb_up,
              title: LocaleKeys.profile_settings_whoAreWe_completeSatisfaction
                  .tr(),
              description: LocaleKeys
                  .profile_settings_whoAreWe_completeSatisfactionTxt
                  .tr(),
            ),
            verticalSpace(26),
            Text(
              LocaleKeys.profile_settings_whoAreWe_OurNumbers.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            verticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildStateItem(
                  number: '500+',
                  label: LocaleKeys.profile_settings_whoAreWe_skilledCrafman
                      .tr(),
                ),
                BuildStateItem(
                  number: '5,000+',
                  label: LocaleKeys.profile_settings_whoAreWe_satisfiedCustomers
                      .tr(),
                ),
                BuildStateItem(
                  number: '10,000+',
                  label: LocaleKeys.profile_settings_whoAreWe_completedServices
                      .tr(),
                ),
              ],
            ),
            verticalSpace(30),
            Center(
              child: Text(
                LocaleKeys.profile_settings_whoAreWe_rights.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
