import 'package:flutter/material.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/widgets/services/services_list_view_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          childAspectRatio: 1.0,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return ServicesListViewItem(
            image: "",
            name: "Feras AZ",
            service: "Cleaner",
            rating: "4.9",
            onTap: () {},
          );
        },
      ),
    );
  }
}
