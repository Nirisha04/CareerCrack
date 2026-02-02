import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/learning_controller.dart';

class LearningView extends StatelessWidget {
  final controller = Get.put(LearningController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text('Learning')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.categories.length,
          itemBuilder: (_, index) {
            final cat = controller.categories[index];
            return GestureDetector(
              onTap: () => Get.toNamed('/learning_category', arguments: cat),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cat.icon, style: const TextStyle(fontSize: 30)),
                      const SizedBox(height: 8),
                      Text(cat.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(cat.subtitle),
                      const SizedBox(height: 12),
                      LinearProgressIndicator(value: cat.progress),
                      const SizedBox(height: 6),
                      Text('${(cat.progress * 100).toInt()}% completed'),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
