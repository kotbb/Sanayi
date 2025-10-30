import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sanayi_app/core/helpers/app_rgx.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/auth/ui/manager/register_cubit/register_cubit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                key: context.read<RegisterCubit>().formKey,
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
                          .read<RegisterCubit>()
                          .phoneNumberController,
                      keyboardType: TextInputType.phone,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 10,
                      buildCounter:
                          (
                            context, {
                            required currentLength,
                            required isFocused,
                            required maxLength,
                          }) => null,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number.';
                        } else if (AppRegex.validatePhoneNumber(value) != '') {
                          return AppRegex.validatePhoneNumber(value);
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
                    RegisterButtonBlocConsumer(),
                    verticalSpace(12),
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

class RegisterButtonBlocConsumer extends StatelessWidget {
  const RegisterButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacementNamed(
            context,
            Routes.otpCodeScreen,
            arguments: context.read<RegisterCubit>().phoneNumberController.text,
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorModel.message)));
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50.h),
            backgroundColor: const Color(0xff102144),
          ),
          onPressed: () {
            if (context
                .read<RegisterCubit>()
                .formKey
                .currentState!
                .validate()) {
              context.read<RegisterCubit>().register();
            }
          },
          child: const Text("Register", style: TextStyle(color: Colors.white)),
        );
      },
    );
  }
}
