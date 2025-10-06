import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/settings/ui/contact_us/widgets/icon_and_title_widget.dart';
import 'package:sanayi_app/features/settings/ui/contact_us/widgets/response_details_widget.dart';
import 'package:sanayi_app/features/settings/ui/contact_us/widgets/whats_app_card.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.profile_settings_contactUs_title.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(40),
            IconAndTitleWidget(),
            verticalSpace(40),
            WhatsAppCard(),
            verticalSpace(32),
            ResponseDetailsWidget(),
            verticalSpace(20),
            Text(
              LocaleKeys.profile_settings_contactUs_subTxt.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ],
        ),
      ),
    );
  }
}
