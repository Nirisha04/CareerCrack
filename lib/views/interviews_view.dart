import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/interviews_controller.dart';

class InterviewsView extends StatelessWidget {
  final controller = Get.put(InterviewsController());

  @override
  Widget build(BuildContext context) {
    final String category = Get.arguments;
    controller.loadInterviews(category);

    return Scaffold(
      appBar: AppBar(title: Text('$category Interviews')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.interviews.isEmpty) {
          return const Center(child: Text("No interviews found."));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.interviews.length,
          itemBuilder: (_, index) {
            final interview = controller.interviews[index];

            return Card(
              child: ListTile(
                title: Text(interview.title),
                subtitle: Text(interview.difficulty),
                onTap: () =>
                    Get.toNamed('/interview_detail', arguments: interview),
              ),
            );
          },
        );
      }),
    );
  }
}
