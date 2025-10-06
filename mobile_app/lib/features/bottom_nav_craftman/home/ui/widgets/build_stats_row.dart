import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sanayi_app/core/styles/colors.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_stat_item.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';
    
class BuildStatsRow extends StatelessWidget {

  const BuildStatsRow({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BuildStatItem(
          title: LocaleKeys.craftmanHome_progress.tr(),
          value: '1',
          icon: Icons.build,
          color: Colors.orange,
        ),
        BuildStatItem(
          title: LocaleKeys.craftmanHome_rating.tr(),
          value: '4.8',
          icon: Icons.star,
          color: Colors.amber,
        ),
        BuildStatItem(
          title: LocaleKeys.craftmanHome_completed.tr(),
          value: '24',
          icon: Icons.check_circle,
          color: Colors.green,
        ),
        BuildStatItem(
          title: LocaleKeys.craftmanHome_revenue.tr(),
          value: '5,250',
          icon: Icons.attach_money,
          color: ColorsManager.mainBlue,
          isMoney: true,
        ),
      ],
    );
  }
}