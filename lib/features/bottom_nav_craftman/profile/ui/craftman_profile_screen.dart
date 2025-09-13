import 'package:flutter/material.dart';
    
class CraftmanProfileScreen extends StatelessWidget {

  const CraftmanProfileScreen({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Text('Craftman Profile Screen', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}