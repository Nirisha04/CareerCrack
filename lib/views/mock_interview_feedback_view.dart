import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mock_interview_controller.dart';

class MockInterviewFeedbackView extends StatelessWidget {
  final controller = Get.find<MockInterviewController>();

  @override
  Widget build(BuildContext context) {
    final feedback = controller.finalFeedback.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Feedback'),
        automaticallyImplyLeading: false,
      ),
      body: feedback == null
          ? const Center(child: Text('No feedback available.'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildScoreSection(context, feedback),
                  const SizedBox(height: 30),
                  _buildDetailSection(
                    'Overall Feedback',
                    feedback.overallFeedback,
                    Icons.insights,
                    Colors.blue,
                  ),
                  const SizedBox(height: 20),
                  _buildListSection(
                    'Key Strengths',
                    feedback.keyStrengths,
                    Icons.check_circle,
                    Colors.green,
                  ),
                  const SizedBox(height: 20),
                  _buildListSection(
                    'Areas for Improvement',
                    feedback.areasForImprovement,
                    Icons.trending_up,
                    Colors.orange,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => Get.offAllNamed('/home'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'BACK TO HOME',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildScoreSection(BuildContext context, dynamic feedback) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Performance Scores',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCircularScore(
                  'Comm.',
                  feedback.communicationScore,
                  Colors.blue,
                ),
                _buildCircularScore(
                  'Conf.',
                  feedback.confidenceScore,
                  Colors.purple,
                ),
                _buildCircularScore(
                  'Clarity',
                  feedback.clarityScore,
                  Colors.teal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularScore(String label, double score, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                value: score / 10,
                strokeWidth: 8,
                backgroundColor: color.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Text(
              score.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildDetailSection(
    String title,
    String content,
    IconData icon,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildListSection(
    String title,
    List<String> items,
    IconData icon,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: CircleAvatar(radius: 3, backgroundColor: color),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(item, style: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
