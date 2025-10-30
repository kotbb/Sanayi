import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanayi_app/core/helpers/secure_storage_helper.dart';
import 'package:sanayi_app/core/helpers/shared_pref.dart';
import 'package:sanayi_app/core/routing/routes.dart';
import 'package:sanayi_app/features/settings/ui/cubit/logout_cubit/logout_cubit.dart';

class LogoutBlocConsumer extends StatelessWidget {
  const LogoutBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          SecureStorageHelper.clearAll();
          SharedPrefHelper().clearAll();

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginScreen,
            (_) => false,
          );
        } else if (state is LogoutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorModel.message ?? "An error occurred during logout.",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return state is LogoutLoading
            ? Center(child: CircularProgressIndicator())
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48.h),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  context.read<LogoutCubit>().logout();
                },
                child: Text(
                  "yes, LogOut",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "NeoSansArabicMedium",
                  ),
                ),
              );
      },
    );
  }
}