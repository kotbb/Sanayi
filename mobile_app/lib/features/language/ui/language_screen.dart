import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          LocaleKeys.profile_settings_lang.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    LocaleKeys.profile_settings_en.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  trailing: Radio(
                    value: 'en',
                    onChanged: (value) {
                      //todo Handle language change
                    },
                  ),
                ),
              ),
              verticalSpace(8),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    LocaleKeys.profile_settings_ar.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  trailing: Radio(
                    value: 'ar',
                    onChanged: (value) {
                      //todo Handle language change
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
