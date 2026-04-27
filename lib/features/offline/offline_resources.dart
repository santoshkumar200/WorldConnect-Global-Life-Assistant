import 'package:flutter/material.dart';

class OfflineResourcesScreen extends StatelessWidget {
  const OfflineResourcesScreen({super.key});

  final List<Map<String, String>> resources = const [
    {'title': 'First Aid Guide', 'desc': 'Complete illustrated guide', 'size': '1.2 MB'},
    {'title': 'Disaster Preparedness', 'desc': 'What to do during earthquake, flood', 'size': '0.8 MB'},
    {'title': 'Emergency Numbers', 'desc': 'Local helplines (all countries)', 'size': '0.3 MB'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline Resources'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          final r = resources[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.download, color: Colors.teal),
              title: Text(r['title']!),
              subtitle: Text('${r['desc']} • ${r['size']}'),
              trailing: const Icon(Icons.download_for_offline),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Download started...')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}