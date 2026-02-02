import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizResultView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {'score': 0, 'total': 0};

    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '${data['score']} / ${data['total']}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.offAllNamed('/home'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
