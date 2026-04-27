import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), backgroundColor: Colors.red),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Push Notifications'),
            value: _notifications,
            onChanged: (v) => setState(() => _notifications = v),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: _language,
              items: ['English', 'Urdu', 'Chinese', 'Arabic'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => _language = v!),
            ),
          ),
          ListTile(
            title: const Text('About'),
            onTap: () => showAboutDialog(context: context, applicationName: 'WorldConnect', applicationVersion: '1.0'),
          ),
        ],
      ),
    );
  }
}