import 'package:flutter/material.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_in_progress_card.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_request_card.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_section_header.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_stats_row.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_welcome_card.dart';

class CraftmanHomeScreen extends StatelessWidget {
  CraftmanHomeScreen({super.key});
  final List<Map<String, dynamic>> _newRequests = [
    {
      'name': 'Osama Mamdoh',
      'service': 'Concrete wall construction',
      'date': '28/7/2025',
      'time': '10:00 AM',
      'status': 'New',
    },
    {
      'name': 'Ahmed Al-Sayed',
      'service': 'Tile installation',
      'date': '29/7/2025',
      'time': '2:00 PM',
      'status': 'New',
    },
  ];

  final List<Map<String, dynamic>> _inProgress = [
    {
      'name': 'Mohamed Ali',
      'service': 'Plumbing repair',
      'date': '27/7/2025',
      'progress': 60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              BuildWelcomeCard(newRequests: _newRequests),
              verticalSpace(22),
              BuildStatsRow(),
              verticalSpace(22),
              BuildSectionHeader(
                title: 'New Requests',
                count: _newRequests.length,
              ),
              verticalSpace(12),
              ..._newRequests.map(
                (request) => BuildRequestCard(request: request, isNew: true),
              ),
              BuildSectionHeader(
                title: 'In Progress',
                count: _inProgress.length,
              ),
              verticalSpace(12),
              ..._inProgress.map(
                (request) => BuildInProgressCard(request: request),
              ),

              verticalSpace(22),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new service or request
        },
        backgroundColor: const Color(0xff102144),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
