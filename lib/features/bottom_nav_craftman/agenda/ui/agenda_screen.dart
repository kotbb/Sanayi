import 'package:flutter/material.dart';
    
class AgendaScreen extends StatelessWidget {

  const AgendaScreen({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Text('Agenda Screen', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}