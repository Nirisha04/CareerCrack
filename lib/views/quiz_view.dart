import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends StatelessWidget {
  final controller = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    final dynamic args = Get.arguments;
    final String category = args is Map ? args['category'] : args ?? 'general';
    final bool onlyCoding = args is Map ? args['mode'] == 'coding' : false;
    final String? difficulty = args is Map ? args['difficulty'] : null;

    // Use a unique ID for the quiz start to avoid loops
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.questions.isEmpty ||
          controller.currentCategory != category) {
        controller.startQuiz(
          category,
          onlyCoding: onlyCoding,
          difficulty: difficulty,
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          onlyCoding
              ? '$category ${difficulty?.capitalizeFirst ?? ""} Coding'
              : '$category Quiz',
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading questions...'),
              ],
            ),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 60, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          );
        }

        if (controller.questions.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.quiz_outlined, size: 60, color: Colors.grey),
                const SizedBox(height: 16),
                const Text('No questions available yet.'),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          );
        }

        final q = controller.questions[controller.currentIndex.value];

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${controller.currentIndex.value + 1}/${controller.questions.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    'Time: ${controller.timeLeft}s',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: controller.timeLeft.value < 10
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: controller.timeLeft.value / 30,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  controller.timeLeft.value < 10 ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                q['question'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              if (q['codeSnippet'] != null)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.indigo.shade300, width: 1),
                  ),
                  child: Text(
                    q['codeSnippet'],
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ...(q['options'] as List<dynamic>).map((option) {
                final isSelected =
                    controller.selectedAnswer.value == option.toString();
                final isCorrect = q['answer'] == option.toString();

                Color? btnColor;
                if (controller.isAnswered.value) {
                  if (isCorrect) {
                    btnColor = Colors.green.shade400;
                  } else if (isSelected) {
                    btnColor = Colors.red.shade400;
                  }
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                    onPressed: controller.isAnswered.value
                        ? null
                        : () => controller.answer(option.toString()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      disabledBackgroundColor: btnColor,
                      foregroundColor: btnColor != null ? Colors.white : null,
                      disabledForegroundColor: btnColor != null
                          ? Colors.white
                          : null,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      option.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              if (controller.isAnswered.value)
                ElevatedButton(
                  onPressed: () => controller.goToNextQuestion(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    controller.currentIndex.value <
                            controller.questions.length - 1
                        ? 'Next Question'
                        : 'See Results',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
