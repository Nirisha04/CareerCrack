import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/analytics_controller.dart';
import '../controllers/auth_controller.dart';

class AnalyticsView extends StatelessWidget {
  final controller = Get.put(AnalyticsController());

  @override
  Widget build(BuildContext context) {
    // Get UID safely
    final authController = Get.find<AuthController>();
    final uid = authController.user.value?.uid;

    if (uid != null) {
      controller.loadAnalytics(uid);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Your Progress')),
      body: Obx(() {
        if (controller.stats.isEmpty) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('No data yet'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Topic Accuracy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  barGroups: controller.stats
                      .asMap()
                      .entries
                      .map(
                        (e) => BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: e.value.accuracy,
                              color: Colors.blue,
                              width: 16,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() < controller.stats.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                controller.stats[value.toInt()].topic.substring(
                                  0,
                                  3,
                                ),
                              ),
                            );
                          }
                          return Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),

            const SizedBox(height: 30),
            if (controller.strengths.isNotEmpty) ...[
              const Text(
                'Strengths',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...controller.strengths.map(
                (e) => ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(e.topic),
                  trailing: Text('${e.accuracy.toStringAsFixed(1)}%'),
                ),
              ),
            ],

            const SizedBox(height: 20),
            if (controller.weaknesses.isNotEmpty) ...[
              const Text(
                'Weaknesses',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...controller.weaknesses.map(
                (e) => ListTile(
                  leading: const Icon(Icons.warning, color: Colors.orange),
                  title: Text(e.topic),
                  trailing: Text('${e.accuracy.toStringAsFixed(1)}%'),
                ),
              ),
            ],
          ],
        );
      }),
    );
  }
}
