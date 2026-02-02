import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  final List<String> topics = [
    'Time & Work',
    'Probability',
    'Arrays',
    'Binary Trees',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (_, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ExpansionTile(
              title: Text(topics[index]),
              subtitle: const Text('Difficulty: Medium'),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
              children: const [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '• Key concept explanation\n• Examples\n• Tips & tricks',
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
