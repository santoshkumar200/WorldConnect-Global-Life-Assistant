import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DisasterDetailScreen extends StatelessWidget {
  final String title;
  final String location;
  final Map<String, dynamic>? details;

  const DisasterDetailScreen({
    super.key,
    required this.title,
    required this.location,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _parseLocation(location),
                zoom: 12,
              ),
              markers: {
                Marker(
                  markerId: MarkerId(location),
                  position: _parseLocation(location),
                  infoWindow: InfoWindow(title: title),
                ),
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location: $location',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    const Text('Safety Tips:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ..._getSafetyTips(title).map((tip) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.green, size: 18),
                              const SizedBox(width: 8),
                              Expanded(child: Text(tip)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getSafetyTips(String type) {
    switch (type.toLowerCase()) {
      case 'earthquake warning':
        return [
          'Drop, cover and hold on.',
          'Stay away from windows.',
          'If outdoors, move to an open area.',
          'Do not use elevators.',
        ];
      case 'flood alert':
        return [
          'Move to higher ground immediately.',
          'Avoid walking or driving through flood water.',
          'Turn off electricity and gas.',
          'Stay tuned to local news.',
        ];
      case 'cyclone approaching':
        return [
          'Stay indoors, away from windows.',
          'Keep emergency kit ready.',
          'Follow official evacuation orders.',
          'Secure loose objects outside.',
        ];
      case 'forest fire':
        return [
          'Evacuate if authorities advise.',
          'Close all windows and doors.',
          'Wear protective clothing.',
          'Avoid breathing smoke.',
        ];
      default:
        return [
          'Stay calm and alert.',
          'Follow instructions from local authorities.',
          'Help others if safe to do so.',
        ];
    }
  }

  LatLng _parseLocation(String loc) {
    // Simple static lookup for demo.
    final lower = loc.toLowerCase();
    if (lower.contains('istanbul')) return const LatLng(41.0082, 28.9784);
    if (lower.contains('mumbai')) return const LatLng(19.0760, 72.8777);
    if (lower.contains('florida')) return const LatLng(27.6648, -81.5158);
    if (lower.contains('sydney')) return const LatLng(-33.8688, 151.2093);
    return const LatLng(0, 0); // fallback
  }
}