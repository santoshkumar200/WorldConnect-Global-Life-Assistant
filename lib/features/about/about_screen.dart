import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About WorldConnect'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: Icon(Icons.public, size: 80, color: Colors.red)),
            const SizedBox(height: 16),
            const Center(child: Text('WorldConnect v1.0', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            const SizedBox(height: 20),
            const Text('Your Global Life Assistant', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            const Divider(),
            ExpansionTile(
              title: const Text('FAQs'),
              children: const [
                ListTile(title: Text('How to use SOS?'), subtitle: Text('Tap the red SOS button on home page.')),
                ListTile(title: Text('Is it offline?'), subtitle: Text('First aid and emergency contacts work offline.')),
              ],
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              // onTap: () => Navigator.pushNamed(context, '/privacy'),
            ),
            const ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Send Feedback'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              // onTap: () => Navigator.pushNamed(context, '/feedback'),
            ),
          ],
        ),
      ),
    );
  }
}