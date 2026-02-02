import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/interviews_controller.dart';
import '../models/interview_model.dart';
import '../controllers/auth_controller.dart';

class InterviewDetailView extends StatelessWidget {
  final controller = Get.find<InterviewsController>();
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final InterviewModel interview = Get.arguments;
    // Get real UID
    final authController = Get.find<AuthController>();
    final uid = authController.user.value?.uid;

    return Scaffold(
      appBar: AppBar(title: Text(interview.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(interview.question, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              TextField(
                controller: answerController,
                decoration: const InputDecoration(
                  labelText: 'Type your answer here',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (uid != null && answerController.text.isNotEmpty) {
                      await controller.submitAnswer(
                        uid,
                        interview.id,
                        answerController.text,
                      );
                      Get.snackbar('Success', 'Answer submitted!');
                      Get.back();
                    } else {
                      Get.snackbar('Error', 'Please enter an answer or login.');
                    }
                  },
                  child: const Text('Submit Answer'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
