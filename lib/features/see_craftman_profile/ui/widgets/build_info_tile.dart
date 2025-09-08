import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      leading: Icon(icon, color: Color(0xff102144)),
      title: Text(
        label,
        style: TextStyle(fontSize: 14.sp, color: Colors.black54),
      ),
      subtitle: Text(
        value,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
