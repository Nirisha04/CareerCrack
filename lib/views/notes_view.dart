import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  final topics = ['Time & Work', 'Probability', 'Arrays', 'Trees'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (_, index) {
          return ExpansionTile(
            title: Text(topics[index]),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
            children: const [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text('• Explanation\n• Examples\n• Tricks'),
              ),
            ],
          );
        },
      ),
    );
  }
}
