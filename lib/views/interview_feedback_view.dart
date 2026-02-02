import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewFeedbackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final feedbackData = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Your Answer:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(feedbackData['answer']),
            const SizedBox(height: 20),
            Text(
              'Feedback:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(feedbackData['feedback'] ?? 'No feedback yet'),
          ],
        ),
      ),
    );
  }
}
