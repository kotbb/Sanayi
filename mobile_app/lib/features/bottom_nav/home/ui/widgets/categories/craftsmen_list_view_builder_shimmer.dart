import 'package:flutter/material.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/services/services_list_view_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CraftsmenListViewBuilderShimmer extends StatelessWidget {
  const CraftsmenListViewBuilderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,

      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 80 / 90,
        ),
        itemBuilder: (context, index) {
          return ServicesListViewItem(
            image: '',
            name: 'name',
            service: 'service',
            rating: '4.0',
            onTap: () {},
          );
        },
      ),
    );
  }
}
