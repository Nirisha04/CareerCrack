import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pdf_controller.dart';

class PdfListView extends StatelessWidget {
  final controller = Get.put(PdfController());

  @override
  Widget build(BuildContext context) {
    final String categoryId = Get.arguments;
    controller.loadPdfs(categoryId);

    return Scaffold(
      appBar: AppBar(title: const Text('PDFs')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.pdfs.length,
          itemBuilder: (_, index) {
            final pdf = controller.pdfs[index];
            return ListTile(
              leading: const Icon(Icons.picture_as_pdf),
              title: Text(pdf['title'] ?? ''),
              subtitle: Text('${pdf['pages']} pages'),
              trailing: LinearProgressIndicator(
                value: (pdf['progress'] ?? 0).toDouble(),
              ),
              onTap: () => Get.toNamed('/pdf_reader', arguments: pdf),
            );
          },
        );
      }),
    );
  }
}
