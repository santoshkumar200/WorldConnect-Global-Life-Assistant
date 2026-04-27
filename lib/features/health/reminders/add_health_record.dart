import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddHealthRecord extends StatefulWidget {
  const AddHealthRecord({super.key});

  @override
  State<AddHealthRecord> createState() => _AddHealthRecordState();
}

class _AddHealthRecordState extends State<AddHealthRecord> {
  final _formKey = GlobalKey<FormState>();
  String _type = 'Weight'; // default
  final _valueController = TextEditingController();
  final _dateController = TextEditingController();

  // Hive box for health records
  late Box _healthBox;

  @override
  void initState() {
    super.initState();
    _healthBox = Hive.box('healthRecords');
    // Set today's date as default
    _dateController.text =
        DateTime.now().toIso8601String().split('T')[0];
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      _dateController.text = date.toIso8601String().split('T')[0];
    }
  }

  Future<void> _saveRecord() async {
    if (!_formKey.currentState!.validate()) return;

    final record = {
      'type': _type,
      'value': double.tryParse(_valueController.text.trim()) ?? 0,
      'date': _dateController.text.trim(),
    };

    // Save to Hive
    await _healthBox.add(record);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Health record saved!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Health Record'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // ✅ initialValue instead of deprecated 'value'
              DropdownButtonFormField<String>(
                initialValue: _type,
                items: ['Weight', 'Blood Pressure', 'Blood Sugar']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => _type = v!),
                decoration: const InputDecoration(labelText: 'Type'),
                validator: (v) => v == null ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Value'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date (YYYY-MM-DD)',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: _selectDate,
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _saveRecord,
                icon: const Icon(Icons.save),
                label: const Text('Save Record'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}