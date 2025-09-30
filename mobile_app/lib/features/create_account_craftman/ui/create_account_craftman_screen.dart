import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/create_account_craftman/ui/widgets/build_input_field_craft_man.dart';
import 'package:sanayi_app/generated/locale_keys.g.dart';

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
                hint: LocaleKeys.createAccount_nameHint.tr(),
                icon: Icons.person_outline,
              ),
              verticalSpace(16),

              // Phone field
              BuildInputFieldCraftMan(
                hint: LocaleKeys.createAccount_phoneHint.tr(),
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              verticalSpace(16),

              // Location field
              BuildInputFieldCraftMan(
                hint: LocaleKeys.createAccount_locationHint.tr(),
                icon: Icons.location_on_outlined,
              ),
              verticalSpace(16),

              // Location field
              BuildInputFieldCraftMan(
                hint: LocaleKeys.createAccount_profession.tr(),
                icon: Icons.work_outline_outlined,
              ),
              verticalSpace(16),

              BuildInputFieldCraftMan(
                hint: LocaleKeys.createAccount_biography.tr(),
                icon: Icons.article_outlined,
                maxLines: 5,
              ),

              verticalSpace(32),

              // Register Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.appLayoutCraftman);
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
