import 'package:flutter/material.dart';

class CookiePreferencesScreen extends StatelessWidget {
  const CookiePreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cookie Preferences')),
      body: const Center(
        child: Text('Préférences cookies (à implémenter)'),
      ),
    );
  }
}
