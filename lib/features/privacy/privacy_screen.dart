import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.red,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last updated: April 2026', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 16),
            Text('We value your privacy...', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('WorldConnect does not share your personal data with third parties. Emergency contacts and health records are stored locally on your device and can be deleted at any time.'),
            SizedBox(height: 16),
            Text('Data Collection:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• Location data: only used for SOS and Nearby Services.\n• Health data: stored only on your device.\n• Community posts: publicly visible but can be removed.'),
            // ... more content
          ],
        ),
      ),
    );
  }
}