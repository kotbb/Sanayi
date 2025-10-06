import 'package:flutter/material.dart';
import 'package:sanayi_app/core/routing/routes.dart';

class BuildSectionHeader extends StatelessWidget {
  String title;
  int count;
  BuildSectionHeader({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.requestsScreen);
          },
          child: Chip(
            label: Text(count.toString()),
            backgroundColor: Colors.blue[100],
          ),
        ),
      ],
    );
  }
}
