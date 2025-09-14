import 'package:flutter/material.dart';
import 'package:sanayi_app/features/bottom_nav_craftman/home/ui/widgets/build_request_card.dart';

class RequestsScreen extends StatelessWidget {
  RequestsScreen({super.key});

  // for test purpose
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Requests Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return BuildRequestCard(request: _newRequests[index]);
          },
        ),
      ),
    );
  }
}
