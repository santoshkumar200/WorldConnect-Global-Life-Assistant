import 'package:flutter/material.dart';
import 'course_detail.dart';

class EducationHub extends StatelessWidget {
  const EducationHub({super.key});

  final List<Map<String, dynamic>> courses = const [
    {'title': 'Basic First Aid', 'video': 'https://www.youtube.com/watch?v=example', 'quiz': ['Q1?', 'Q2?']},
    {'title': 'Disaster Preparedness', 'video': 'https://www.youtube.com/watch?v=example2', 'quiz': ['Q1?', 'Q2?']},
    {'title': 'Learn CPR', 'video': 'https://www.youtube.com/watch?v=example3', 'quiz': ['Q1?', 'Q2?']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Education Hub'), backgroundColor: Colors.indigo),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final c = courses[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.play_circle, size: 40, color: Colors.indigo),
              title: Text(c['title']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetail(course: c)));
              },
            ),
          );
        },
      ),
    );
  }
}