import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class TitleAndLastUpdateWidget extends StatelessWidget {
  const TitleAndLastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            LocaleKeys.profile_settings_privacyAndPolicy_terms.tr(),
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(10),
        Center(
          child: Text(
            LocaleKeys.profile_settings_privacyAndPolicy_lastUpdate.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
