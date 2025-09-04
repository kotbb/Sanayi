import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  Function()? onTap;
  Widget leading;
  String title;
  Widget trailing;
  ListTileWidget({
    super.key,
    this.onTap,
    required this.leading,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: leading,
        title: Text(title),
        trailing: trailing,
      ),
    );
  }
}
