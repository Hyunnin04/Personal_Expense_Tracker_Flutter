import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  final Map<String, double> dataMap = {
    'Food': 300,
    'Transport': 150,
    'Shopping': 100,
    'Entertainment': 80,
  };

  final List<Color> sectionColors = [
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Analytics', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Spending Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child: PieChart(
                PieChartData(
                  sections: List.generate(dataMap.length, (index) {
                    final entry = dataMap.entries.elementAt(index);
                    return PieChartSectionData(
                      color:
                          sectionColors[index %
                              sectionColors.length], // Different color
                      title: '${entry.key}\n\$${entry.value}',
                      value: entry.value,
                      radius: 80,
                      titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
