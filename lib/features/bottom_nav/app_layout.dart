import 'package:flutter/material.dart';
import 'package:sanayi_app/core/widgets/custom_bottom_nav.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/app_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = context.read<AppCubit>();
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: CustomBottomNav(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
