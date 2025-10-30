import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/auth/ui/manager/login/auth_cubit.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          log("Login Success in Login Screen");
          Navigator.pushNamed(
            context,
            Routes.appLayout,
            arguments: state.loginResponseModel.user.name,
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorModel.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return state is AuthLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff102144),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (context
                        .read<AuthCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<AuthCubit>().login();
                    }
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              );
      },
    );
  }
}
