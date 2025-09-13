import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/core/widgets/craftman/custom_bottom_nav_craftman.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/app_cubit.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/app_state.dart';

class AppLayoutCraftman extends StatelessWidget {
  const AppLayoutCraftman({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = context.read<AppCubit>();
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: cubit.craftmanBottomScreens[cubit.currentIndex],
          bottomNavigationBar: CustomBottomNavCraftman(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeCraftmanBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
