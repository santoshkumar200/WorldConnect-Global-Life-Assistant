import 'package:flutter/material.dart';
import 'detail/disaster_detail.dart';

class DisasterListScreen extends StatelessWidget {
  const DisasterListScreen({super.key});

  final List<Map<String, dynamic>> alerts = const [
    {
      'title': 'Earthquake Warning',
      'location': 'Istanbul, Turkey',
      'severity': 'High',
      'time': '2 hours ago',
      'icon': Icons.landslide,
      'color': Colors.red,
    },
    {
      'title': 'Flood Alert',
      'location': 'Mumbai, India',
      'severity': 'Medium',
      'time': '5 hours ago',
      'icon': Icons.water_damage,
      'color': Colors.orange,
    },
    {
      'title': 'Cyclone Approaching',
      'location': 'Florida, USA',
      'severity': 'Critical',
      'time': '30 min ago',
      'icon': Icons.air,
      'color': Colors.deepPurple,
    },
    {
      'title': 'Forest Fire',
      'location': 'Sydney, Australia',
      'severity': 'High',
      'time': '1 day ago',
      'icon': Icons.local_fire_department,
      'color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Alerts'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          final alert = alerts[index];
          return Card(
            // ✅ withValues(alpha: 0.1) replaces withOpacity(0.1)
            color: (alert['color'] as Color).withValues(alpha: 0.1),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(alert['icon'], size: 40, color: alert['color']),
              title: Text(alert['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: alert['color'])),
              subtitle: Text('${alert['location']} • ${alert['time']}'),
              trailing: Chip(
                label: Text(alert['severity'],
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
                backgroundColor: alert['color'],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DisasterDetailScreen(
                      title: alert['title'],
                      location: alert['location'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}