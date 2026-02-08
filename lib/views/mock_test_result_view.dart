import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mock_test_controller.dart';

class MockTestResultView extends StatelessWidget {
  final controller = Get.find<MockTestController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mock Test Result')),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Accuracy: ${((controller.correct.value / (controller.questions.length > 0 ? controller.questions.length : 1)) * 100).toStringAsFixed(1)}%',
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                'XP Gained: ${controller.xp.value}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Strengths & Weaknesses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: controller.categoryTotal.keys.map((cat) {
                    double acc =
                        (controller.categoryCorrect[cat] ?? 0) /
                        (controller.categoryTotal[cat] ?? 1);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cat,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${(acc * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                              color: acc > 0.7
                                  ? Colors.green
                                  : acc > 0.4
                                  ? Colors.orange
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.resetTest();
                  Get.offAllNamed('/home');
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
