import 'package:flutter/material.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class BuildDetailsItem extends StatelessWidget {
  IconData icon;
  String title;
  String value;

  BuildDetailsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xff102144), size: 24),
        verticalSpace(6),
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        Text(value, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
