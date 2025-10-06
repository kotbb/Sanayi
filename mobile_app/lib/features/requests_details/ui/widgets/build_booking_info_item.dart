import 'package:flutter/material.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class BuildBookingInfoItem extends StatelessWidget {
  String title;
  String value;
  IconData icon;

  BuildBookingInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xff102144), size: 24),
        verticalSpace(8),
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        Text(value, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
