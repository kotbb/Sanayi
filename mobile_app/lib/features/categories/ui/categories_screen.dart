import 'package:flutter/material.dart';
import 'package:sanayi_app/features/categories/ui/widgets/categories_grid_view_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          childAspectRatio: 1.0,
        ),
        itemCount: 11,
        itemBuilder: (context, index) {
          return CategoriesGridViewItem(
            image: "assets/images/svg/cleaner.svg",
            label: 'Cleaner',
            onTap: () {},
          );
        },
      ),
    );
  }
}
