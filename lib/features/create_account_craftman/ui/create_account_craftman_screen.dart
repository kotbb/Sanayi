import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/create_account_craftman/ui/widgets/build_input_field_craft_man.dart';

class CreateAccountCraftmanScreen extends StatelessWidget {
  const CreateAccountCraftmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/sanayi_logo.png",
                  width: 250.w,
                  height: 250.h,
                ),
              ),
              verticalSpace(32),

              // Name field
              BuildInputFieldCraftMan(
                hint: "Full Name",
                icon: Icons.person_outline,
              ),
              verticalSpace(16),

              // Phone field
              BuildInputFieldCraftMan(
                hint: "Phone Number",
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              verticalSpace(16),

              // Location field
              BuildInputFieldCraftMan(
                hint: "Loaction",
                icon: Icons.location_on_outlined,
              ),
              verticalSpace(16),

              // Location field
              BuildInputFieldCraftMan(
                hint: "Profession",
                icon: Icons.work_outline_outlined,
              ),
              verticalSpace(16),

              BuildInputFieldCraftMan(
                hint: "the biography",
                icon: Icons.article_outlined,
                maxLines: 5,
              ),

              verticalSpace(32),

              // Register Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.appLayout);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    backgroundColor: const Color(0xff102144),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
