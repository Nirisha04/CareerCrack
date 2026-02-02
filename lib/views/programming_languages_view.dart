import 'package:flutter/material.dart';

class ProgrammingLanguagesView extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {'name': 'C', 'progress': 0.7},
    {'name': 'C++', 'progress': 0.6},
    {'name': 'Java', 'progress': 0.5},
    {'name': 'Python', 'progress': 0.8},
    {'name': 'SQL', 'progress': 0.4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programming Languages')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: languages.length,
        itemBuilder: (_, index) {
          final lang = languages[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black.withValues(alpha: 0.05),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.code, size: 40),
                const SizedBox(height: 8),
                Text(
                  lang['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: lang['progress']),
                const SizedBox(height: 6),
                Text('${(lang['progress'] * 100).toInt()}%'),
              ],
            ),
          );
        },
      ),
    );
  }
}
