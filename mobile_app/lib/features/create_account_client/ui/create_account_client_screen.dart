import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/create_account_client/ui/widgets/build_input_field.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

class CreateAccountClientScreen extends StatelessWidget {
  const CreateAccountClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Center(
                child: Image.asset(
                  "assets/images/sanayi_logo.png",
                  width: 250.w,
                  height: 250.h,
                ),
              ),

              verticalSpace(32),

              // Name field
              BuildInputField(hint: LocaleKeys.createAccount_nameHint.tr(), icon: Icons.person_outline),
              verticalSpace(16),

              // Phone field
              BuildInputField(
                hint: LocaleKeys.createAccount_phoneHint.tr(),
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              verticalSpace(16),

              // Location field
              BuildInputField(
                hint: LocaleKeys.createAccount_locationHint.tr(),
                icon: Icons.location_on_outlined,
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
                    LocaleKeys.createAccount_createBtn.tr(),
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
