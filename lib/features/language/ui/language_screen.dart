import 'package:flutter/material.dart';
import 'package:sanayi_app/core/helpers/spacing.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text('Lanuage'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  title: const Text('English'),
                  trailing: Radio(
                    value: 'en',
                    onChanged: (value) {
                      // Handle language change
                    },
                  ),
                ),
              ),
              verticalSpace(8),
              Container(
                color: Colors.white,
                child: ListTile(
                  title: const Text('Arabic'),
                  trailing: Radio(
                    value: 'ar',
                    onChanged: (value) {
                      // Handle language change
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
