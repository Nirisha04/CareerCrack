import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AptitudeDetailView extends StatelessWidget {
  const AptitudeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> section = Get.arguments;
    final String title = section['title'];
    final IconData icon = section['icon'];
    final Color color = section['color'];
    final List<String> topics = section['topics'];

    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: color),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(icon, size: 60, color: color),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ready to Master $title?',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Learn topics and practice with timed MCQs.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Learning Section
            const Text(
              'Topic-wise Learning',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...topics.map((topic) => _buildTopicTile(context, topic, color)),

            const SizedBox(height: 30),

            // Practice Section
            const Text(
              'Sectional Practice',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPracticeCard(context, title, color),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicTile(BuildContext context, String topic, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.menu_book, color: color),
        title: Text(topic, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Navigate to specific topic notes (mocked for now)
          Get.snackbar(
            'Coming Soon',
            'Learning content for $topic is being prepared!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }

  Widget _buildPracticeCard(
    BuildContext context,
    String sectionTitle,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(Icons.timer, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            'Full $sectionTitle Practice',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text('15 Questions | 15 Minutes | XP Bonus'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Start a quiz with this specific category
              Get.toNamed('/quiz', arguments: sectionTitle);
            },
            style: ElevatedButton.styleFrom(backgroundColor: color),
            child: const Text('Start Practice Test'),
          ),
        ],
      ),
    );
  }
}
