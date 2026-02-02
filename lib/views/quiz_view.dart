import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends StatelessWidget {
  final controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    final String category =
        Get.arguments ?? 'general'; // Default category if null
    // Ensure startQuiz is called only once or properly managed.
    // Putting it in build might cause repeated calls if not handled.
    // For now, following user implementation.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.questions.isEmpty) controller.startQuiz(category);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Obx(() {
        if (controller.questions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final q = controller.questions[controller.currentIndex.value];

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Time: ${controller.timeLeft}s',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 16),
              Text(
                q['question'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ...(q['options'] as List<dynamic>).map((option) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(
                    onPressed: () => controller.answer(option.toString()),
                    child: Text(option.toString()),
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
