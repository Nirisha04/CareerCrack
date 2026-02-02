import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/learning_model.dart';

class LearningCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LearningCategory category = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                LinearProgressIndicator(value: category.progress),
                const SizedBox(height: 6),
                Text('${(category.progress * 100).toInt()}% Completed'),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              children: [
                _tile('Notes', Icons.note, '/notes'),
                _tile('Videos', Icons.play_circle, '/videos'),
                _tile('PDFs', Icons.picture_as_pdf, '/pdfs'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tile(String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

