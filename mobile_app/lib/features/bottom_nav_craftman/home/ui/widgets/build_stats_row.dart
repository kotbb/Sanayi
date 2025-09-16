import 'package:flutter/material.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_stat_item.dart';
    
class BuildStatsRow extends StatelessWidget {

  const BuildStatsRow({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BuildStatItem(
          title: 'In Progress',
          value: '1',
          icon: Icons.build,
          color: Colors.orange,
        ),
        BuildStatItem(
          title: 'Rating',
          value: '4.8',
          icon: Icons.star,
          color: Colors.amber,
        ),
        BuildStatItem(
          title: 'Completed',
          value: '24',
          icon: Icons.check_circle,
          color: Colors.green,
        ),
        BuildStatItem(
          title: 'Revenue',
          value: '5,250',
          icon: Icons.attach_money,
          color: const Color(0xff102144),
          isMoney: true,
        ),
      ],
    );
  }
}