import 'package:flutter/material.dart';
import 'package:sanayi_app/core/styles/colors.dart';

class BuildInfoTile extends StatelessWidget {
  IconData icon;
  String label;
  String value;

  BuildInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorsManager.mainBlue),
      title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      subtitle: Text(value, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
