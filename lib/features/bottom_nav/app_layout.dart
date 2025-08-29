import 'package:flutter/material.dart';
import 'package:sanayi_app/core/widgets/custom_bottom_nav.dart';
import 'package:sanayi_app/features/bottom_nav/home/ui/home_screen.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: CustomBottomNav(currentIndex: 1, onTap: (int p1) {}),
    );
  }
}
