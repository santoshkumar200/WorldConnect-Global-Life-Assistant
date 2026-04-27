import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  bool _loading = false;

  Future<void> _triggerSOS() async {
    // confirm before acting
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Activate Emergency SOS'),
        content: const Text(
            'This will call 1122 and send your location to emergency contacts. Proceed?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Activate'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _loading = true);

    try {
      // ✅ Updated: use LocationSettings instead of deprecated desiredAccuracy
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 0, // immediately
        ),
      );

      // Construct message
      final message =
          'Emergency! I need help. My location: https://maps.google.com/?q=${position.latitude},${position.longitude}';

      // Call 1122
      const phone = 'tel:1122';
      if (await canLaunchUrl(Uri.parse(phone))) {
        await launchUrl(Uri.parse(phone));
      }

      // Send SMS to trusted contacts (replace numbers as needed)
      final contacts = ['+923001234567']; // user can edit from EmergencyContacts
      for (final contact in contacts) {
        final smsUri = Uri.parse(
            'sms:$contact?body=${Uri.encodeComponent(message)}');
        if (await canLaunchUrl(smsUri)) {
          await launchUrl(smsUri);
        }
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                '🚨 SOS sent to emergency services and your contacts!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber_rounded,
                size: 100, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              'Tap the button to alert emergency services',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            _loading
                ? const CircularProgressIndicator(color: Colors.red)
                : SizedBox(
                    width: 200,
                    height: 200,
                    child: ElevatedButton(
                      onPressed: _triggerSOS,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: const Text(
                        'SOS',
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}