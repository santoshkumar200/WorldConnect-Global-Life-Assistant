import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather'), backgroundColor: Colors.lightBlue),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wb_sunny, size: 80, color: Colors.orange),
            const Text('27°C', style: TextStyle(fontSize: 48)),
            const Text('Partly Cloudy, Karachi'),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text('Refresh')),
          ],
        ),
      ),
    );
  }
}