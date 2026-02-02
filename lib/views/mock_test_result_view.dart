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
              Text('Correct: ${controller.correct}'),
              Text('Wrong: ${controller.wrong}'),
              Text(
                'Final Score: ${controller.calculatedScore.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
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
