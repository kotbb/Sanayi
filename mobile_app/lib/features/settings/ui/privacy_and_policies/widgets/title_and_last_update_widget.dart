import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff102144),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        verticalSpace(10),
        Center(
          child: Text(
            LocaleKeys.profile_settings_privacyAndPolicy_lastUpdate.tr(),
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
          ),
        ),
      ],
    );
  }
}
