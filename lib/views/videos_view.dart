import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/video_controller.dart';

class VideosView extends StatelessWidget {
  final controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    final String categoryId = Get.arguments;

    controller.loadVideos(categoryId);

    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.videos.length,
          itemBuilder: (_, index) {
            final video = controller.videos[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const Icon(Icons.play_circle_fill, size: 40),
                title: Text(video['title'] ?? ''),
                subtitle: Text(video['duration'] ?? ''),
                trailing: LinearProgressIndicator(
                  value: (video['progress'] ?? 0).toDouble(),
                ),
                onTap: () {
                  Get.toNamed('/video_player', arguments: video);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
