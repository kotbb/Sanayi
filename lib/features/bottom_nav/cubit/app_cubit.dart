import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanayi_app/core/helpers/constants.dart';
import 'package:sanayi_app/features/bottom_nav/cubit/app_state.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/home_screen.dart';
import 'package:sanayi_app/features/bottom_nav/profile/ui/profile_screen.dart';
import 'package:sanayi_app/features/bottom_nav/reservations/ui/reservations_screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    ReservationsScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(state.copyWith(changeBottomNavStatus: RequestsStatus.success));
  }
}
