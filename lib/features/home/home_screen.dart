import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorldConnect'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildTile(
              context,
              icon: Icons.warning_amber_rounded,
              label: 'Emergency\nSOS',
              color: Colors.red.shade700,
              route: '/emergency_sos',
            ),
            _buildTile(
              context,
              icon: Icons.health_and_safety,
              label: 'First Aid',
              color: Colors.teal,
              route: '/first_aid',
            ),
            _buildTile(
              context,
              icon: Icons.warning,
              label: 'Disaster Alerts',
              color: Colors.orange,
              route: '/disasters',
            ),
            _buildTile(
              context,
              icon: Icons.translate,
              label: 'Translator',
              color: Colors.blue,
              route: '/translator',
            ),
            _buildTile(
              context,
              icon: Icons.favorite,
              label: 'Health Tracker',
              color: Colors.pink,
              route: '/health',
            ),
            _buildTile(
              context,
              icon: Icons.map,
              label: 'Nearby Services',
              color: Colors.green,
              route: '/map_services',
            ),
            _buildTile(
              context,
              icon: Icons.people,
              label: 'Community',
              color: Colors.purple,
              route: '/community',
            ),
            _buildTile(
              context,
              icon: Icons.school,
              label: 'Education',
              color: Colors.indigo,
              route: '/education',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required String route,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}