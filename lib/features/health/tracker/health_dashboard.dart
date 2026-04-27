import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../reminders/add_health_record.dart';
import '../reminders/medicine_reminder.dart';

class HealthDashboard extends StatelessWidget {
  // 🔥 'const' hata diya constructor se
  HealthDashboard({super.key});

  // Dummy data – baad mein Firebase/Hive se replace karna
  final List<double> bpSystolic = [120, 118, 125, 122, 119];
  final List<double> bpDiastolic = [80, 79, 82, 81, 78];
  final List<double> weight = [70.5, 70.2, 69.8, 69.6, 69.4];
  final List<double> sugar = [90, 95, 92, 88, 91]; // mg/dL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Tracker'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Blood Pressure', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: List.generate(bpSystolic.length, (i) => BarChartGroupData(x: i, barRods: [
                    BarChartRodData(toY: bpSystolic[i], color: Colors.red, width: 12),
                    BarChartRodData(toY: bpDiastolic[i], color: Colors.blue, width: 12),
                  ])),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Weight (kg)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: weight.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                      isCurved: true,
                      color: Colors.green,
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Blood Sugar (mg/dL)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: sugar.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                      isCurved: true,
                      color: Colors.orange,
                      dotData: const FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddHealthRecord())),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Record'),
                ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MedicineReminder())),
                  icon: const Icon(Icons.alarm),
                  label: const Text('Medicine Reminder'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}