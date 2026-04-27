import 'package:flutter/material.dart';

class MedicineReminder extends StatefulWidget {
  const MedicineReminder({super.key});

  @override
  State<MedicineReminder> createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  final List<Map<String, dynamic>> _reminders = [
    {'name': 'Paracetamol', 'time': '08:00 AM', 'active': true},
    {'name': 'Vitamin C', 'time': '09:00 PM', 'active': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Reminders'), backgroundColor: Colors.pink),
      body: ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          final r = _reminders[index];
          return ListTile(
            leading: Icon(Icons.medication, color: r['active'] ? Colors.green : Colors.grey),
            title: Text(r['name']),
            subtitle: Text(r['time']),
            trailing: Switch(
              value: r['active'],
              onChanged: (v) => setState(() => r['active'] = v),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // simple add dialog
          final nameC = TextEditingController();
          final timeC = TextEditingController();
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Add Reminder'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: nameC, decoration: const InputDecoration(labelText: 'Medicine name')),
                  TextField(controller: timeC, decoration: const InputDecoration(labelText: 'Time (e.g. 08:00 AM)')),
                ],
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _reminders.add({'name': nameC.text, 'time': timeC.text, 'active': true});
                    });
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}