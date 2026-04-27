import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),
            Text(user?.email ?? 'No email',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.contacts_rounded, color: Colors.red),
              title: const Text('Emergency Contacts'),
              trailing: const Icon(Icons.edit),
              
              onTap: () {
                Navigator.pushNamed(context, '/emergency_contacts');
              },
            ),
            const Divider(indent: 20, endIndent: 20),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.red),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}