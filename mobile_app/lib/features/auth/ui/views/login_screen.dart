import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanayi_app/core/helpers/app_rgx.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/auth/ui/manager/login/auth_cubit.dart';
import 'package:sanayi_app/features/auth/ui/views/widgets/login_button_bloc_consumer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: Color(0xfffEBF0F4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/svg/login.svg",
                  width: 150.w,
                  height: 150.h,
                ),
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: context.read<AuthCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your phone number",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(16),
                    TextFormField(
                      controller: context
                          .read<AuthCubit>()
                          .phoneNumberController,
                      keyboardType: TextInputType.phone,
                      buildCounter:
                          (
                            context, {
                            required currentLength,
                            required isFocused,
                            required maxLength,
                          }) => null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(
                          AppRegex.validatePhoneNumber(value),
                        ).hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            horizontalSpace(16),
                            Text(
                              "+970",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff102144),
                              ),
                            ),
                            horizontalSpace(8),
                            Container(
                              width: 1.w,
                              height: 24.h,
                              color: Colors.grey.shade400,
                            ),
                            horizontalSpace(8),
                          ],
                        ),
                        filled: true,
                        fillColor: Color(0xfffEBF0F4),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    verticalSpace(36),
                    LoginButtonBlocConsumer(),
                    verticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signupScreen);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
