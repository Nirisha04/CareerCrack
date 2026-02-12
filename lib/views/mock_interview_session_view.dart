import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mock_interview_controller.dart';
import '../models/mock_interview_model.dart';

class MockInterviewSessionView extends StatelessWidget {
  final controller = Get.find<MockInterviewController>();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            'Question ${controller.currentQuestionIndex.value + 1} of ${controller.questions.length}',
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Obx(() {
                final seconds = controller.remainingSeconds.value;
                return Text(
                  '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.questions.isEmpty) {
          return const Center(child: Text('No questions found.'));
        }

        final question =
            controller.questions[controller.currentQuestionIndex.value];

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value:
                    (controller.currentQuestionIndex.value + 1) /
                    controller.questions.length,
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 30),
              Text(
                question.category,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                question.text,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Provide your response:',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TextField(
                  controller: textController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Type your answer here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildResponseActions(context),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildResponseActions(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                context,
                'Voice Response',
                Icons.mic,
                Colors.orange,
                () async {
                  bool hasPermission = await controller
                      .checkAndRequestPermissions(ResponseType.audio);
                  if (hasPermission) {
                    Get.snackbar(
                      'Microphone Active',
                      'Microphone access granted. Starting recording...',
                    );
                    controller.nextQuestion(
                      'Audio response recorded',
                      ResponseType.audio,
                    );
                    textController.clear();
                  }
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildActionButton(
                context,
                'Video Response',
                Icons.videocam,
                Colors.red,
                () async {
                  bool hasPermission = await controller
                      .checkAndRequestPermissions(ResponseType.video);
                  if (hasPermission) {
                    await controller.initializeCamera();
                    if (controller.isCameraInitialized.value) {
                      Get.snackbar(
                        'Camera Active',
                        'Camera and Microphone access granted.',
                      );
                      controller.nextQuestion(
                        'Video response recorded',
                        ResponseType.video,
                      );
                      textController.clear();
                    }
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (textController.text.trim().isNotEmpty) {
                controller.nextQuestion(
                  textController.text.trim(),
                  ResponseType.text,
                );
                textController.clear();
              } else {
                Get.snackbar(
                  'Error',
                  'Please enter a response or use Voice/Video.',
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('SUBMIT TEXT RESPONSE'),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
