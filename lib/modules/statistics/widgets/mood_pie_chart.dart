import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MoodPieChart extends StatelessWidget {
  final int happy;
  final int relax;
  final int normal;
  final int sad;
  final int angry;

  const MoodPieChart({
    super.key,
    required this.happy,
    required this.relax,
    required this.normal,
    required this.sad,
    required this.angry,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Distribusi Mood",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 220,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 45,
                  sectionsSpace: 3,
                  sections: [
                    PieChartSectionData(
                      color: Colors.orange,
                      value: happy.toDouble(),
                      title: happy.toString(),
                      radius: 60,
                    ),

                    PieChartSectionData(
                      color: Colors.green,
                      value: relax.toDouble(),
                      title: relax.toString(),
                      radius: 60,
                    ),

                    PieChartSectionData(
                      color: Colors.blue,
                      value: normal.toDouble(),
                      title: normal.toString(),
                      radius: 60,
                    ),

                    PieChartSectionData(
                      color: Colors.grey,
                      value: sad.toDouble(),
                      title: sad.toString(),
                      radius: 60,
                    ),

                    PieChartSectionData(
                      color: Colors.red,
                      value: angry.toDouble(),
                      title: angry.toString(),
                      radius: 60,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 18,
              runSpacing: 10,
              children: const [
                _Legend(Colors.orange, "😊 Senang"),
                _Legend(Colors.green, "🙂 Tenang"),
                _Legend(Colors.blue, "😐 Biasa"),
                _Legend(Colors.grey, "😔 Sedih"),
                _Legend(Colors.red, "😡 Angry"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String text;

  const _Legend(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}