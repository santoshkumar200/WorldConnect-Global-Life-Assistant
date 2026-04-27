import 'package:flutter/material.dart';
import 'first_aid_detail.dart';

class FirstAidCategories extends StatelessWidget {
  const FirstAidCategories({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Cuts & Wounds',
      'icon': Icons.content_cut,
      'steps': [
        'Wash your hands.',
        'Apply gentle pressure with a clean cloth.',
        'Rinse the wound with clean water.',
        'Apply antibiotic cream.',
        'Cover with a sterile bandage.',
      ],
    },
    {
      'title': 'Burns',
      'icon': Icons.local_fire_department,
      'steps': [
        'Cool the burn under cool running water (10-20 min).',
        'Remove tight items (rings, watches).',
        'Apply aloe vera or burn gel.',
        'Cover loosely with a clean bandage.',
        'Do not break blisters.',
      ],
    },
    {
      'title': 'CPR (Cardiopulmonary Resuscitation)',
      'icon': Icons.favorite,
      'steps': [
        'Check responsiveness - shout and tap.',
        'Call emergency services.',
        'Open airway, check breathing for 5-10 sec.',
        'Give 30 chest compressions (center of chest).',
        'Give 2 rescue breaths.',
        'Repeat until help arrives.',
      ],
    },
    {
      'title': 'Choking',
      'icon': Icons.air,
      'steps': [
        'Ask "Are you choking?" – if cannot talk/cough, proceed.',
        'Stand behind, wrap arms around waist.',
        'Make a fist above navel, grab with other hand.',
        'Thrust inward & upward 5 times (Heimlich maneuver).',
        'Repeat until object is expelled.',
      ],
    },
    {
      'title': 'Fractures',
      'icon': Icons.accessibility_new,
      'steps': [
        'Stop any bleeding, apply pressure.',
        'Immobilize the broken bone (splint).',
        'Apply ice to reduce swelling.',
        'Seek medical help immediately.',
        'Do not realign the bone.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Aid Guide'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(cat['icon'], size: 36, color: Colors.teal),
              title: Text(cat['title'], style: const TextStyle(fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => FirstAidDetail(
                    title: cat['title'],
                    steps: cat['steps'],
                  ),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}