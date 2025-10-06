import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/styles/colors.dart';

class BuildInputField extends StatelessWidget {
  String hint;
  IconData icon;
  TextInputType keyboardType;

  BuildInputField({
    super.key,
    required this.hint,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: ColorsManager.mainBlue),
        hintText: hint,
        hintStyle: Theme.of(
          context,
        ).textTheme.displaySmall?.copyWith(fontSize: 16.sp),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
