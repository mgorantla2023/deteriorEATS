import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About deteriorEATS')),
      backgroundColor: AppColors.background,
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🥦 deteriorEATS 🍎',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'deteriorEATS helps you reduce food waste by tracking the expiration dates of your groceries.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Save Food • Save Money • Save Earth 🌎',
              style: TextStyle(fontSize: 18, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
