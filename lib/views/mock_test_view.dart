import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mock_test_controller.dart';
import '../models/question_model.dart';

class MockTestView extends StatelessWidget {
  final MockTestController controller = Get.put(MockTestController());

  MockTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mock Test'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: const Text('Exit Test?'),
                content: const Text('Your progress in this test will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.resetTest();
                      Get.offAllNamed('/home');
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade900, Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if (controller.questions.isEmpty) {
              return const Center(
                child: Text(
                  'No questions available',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            Question question =
                controller.questions[controller.currentQuestionIndex.value];

            return Column(
              children: [
                // Top bar with timer, score, streak
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: controller.timeLeft.value < 10
                              ? Colors.red
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Time: ${controller.timeLeft.value}s',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${controller.xp.value} XP',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${controller.streak.value}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Progress bar for timer
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: LinearProgressIndicator(
                    value: controller.timeLeft.value / 60,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      controller.timeLeft.value < 10
                          ? Colors.red
                          : Colors.orange,
                    ),
                  ),
                ),
                // Question
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Question ${controller.currentQuestionIndex.value + 1}/${controller.questions.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              question.question,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        if (question.codeSnippet != null)
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue.shade300,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              question.codeSnippet!,
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontFamily: 'monospace',
                                fontSize: 13,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            children: question.options.asMap().entries.map((
                              entry,
                            ) {
                              int index = entry.key;
                              String option = entry.value;
                              return Obx(() {
                                bool isSelected =
                                    controller.selectedAnswer.value == index;
                                bool isCorrect =
                                    controller.showExplanation.value &&
                                    index == question.correctAnswerIndex;
                                bool isWrong =
                                    controller.showExplanation.value &&
                                    isSelected &&
                                    index != question.correctAnswerIndex;
                                return GestureDetector(
                                  onTap: controller.showExplanation.value
                                      ? null
                                      : () => controller.selectAnswer(index),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: isCorrect
                                          ? Colors.green
                                          : isWrong
                                          ? Colors.red
                                          : isSelected
                                          ? Colors.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            option,
                                            style: TextStyle(
                                              color: isCorrect || isWrong
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        if (controller.showExplanation.value)
                                          Icon(
                                            isCorrect
                                                ? Icons.check_circle
                                                : isWrong
                                                ? Icons.cancel
                                                : Icons.radio_button_unchecked,
                                            color: Colors.white,
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                          () => controller.showExplanation.value
                              ? Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Explanation',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          question.explanation,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                        const SizedBox(height: 10),
                                        ElevatedButton(
                                          onPressed: controller.nextQuestion,
                                          child: const Text('Next Question'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
