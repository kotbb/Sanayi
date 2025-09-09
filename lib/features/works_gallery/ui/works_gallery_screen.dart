import 'package:flutter/material.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/works_gallery/ui/widgets/work_gallery_item_builder.dart';

class WorksGalleryScreen extends StatelessWidget {
  const WorksGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Works Gallery'), centerTitle: true),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          childAspectRatio: 1.0,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return WorkGalleryItemBuilder(
            image:
                'https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg',
            title: 'Cleaning 2 backyards',
            date: '25/06/2025',
            onTap: () {
              Navigator.pushNamed(context, Routes.workGalleryDetailsScreen);
            },
          );
        },
      ),
    );
  }
}
