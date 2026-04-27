import 'package:flutter/material.dart';

class FirstAidDetail extends StatelessWidget {
  final String title;
  final List<String> steps;
  const FirstAidDetail({super.key, required this.title, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Steps to Follow:',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: steps.length,
                separatorBuilder: (_, _) => const Divider(), // ✅ dono underscore single
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.teal.shade100,
                        child: Text('${index + 1}', style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(steps[index], style: const TextStyle(fontSize: 16))),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}