import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class ResponseDetailsWidget extends StatelessWidget {
  const ResponseDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.access_time, color: Colors.green),
            title: Text(
              LocaleKeys.profile_settings_contactUs_responsetime.tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: Text(
              LocaleKeys.profile_settings_contactUs_responseTxt.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text(
              LocaleKeys.profile_settings_contactUs_workingHours.tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: Text(
              LocaleKeys.profile_settings_contactUs_workingHoursTxt.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help, color: Colors.green),
            title: Text(
              LocaleKeys.profile_settings_contactUs_needHelp.tr(),
              style: Theme.of(context).textTheme.labelMedium,
            ),
            subtitle: Text(
              LocaleKeys.profile_settings_contactUs_needHelpTxt.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
