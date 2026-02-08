import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/quiz_data.dart';

class QuizSelectionView extends StatelessWidget {
  const QuizSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = quizData.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Domain / Language'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(context, category);
        },
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category) {
    IconData icon;
    Color color;

    switch (category) {
      case 'C':
        icon = Icons.code;
        color = Colors.blue;
        break;
      case 'C++':
        icon = Icons.terminal;
        color = Colors.blueAccent;
        break;
      case 'Java':
        icon = Icons.coffee;
        color = Colors.orange;
        break;
      case 'Python':
        icon = Icons.data_array;
        color = Colors.yellow.shade800;
        break;
      case 'SDE':
        icon = Icons.architecture;
        color = Colors.purple;
        break;
      case 'SRE':
        icon = Icons.settings_suggest;
        color = Colors.teal;
        break;
      case 'Cloud':
        icon = Icons.cloud;
        color = Colors.lightBlue;
        break;
      case 'Flutter':
        icon = Icons.flutter_dash;
        color = Colors.blue;
        break;
      case 'Dart':
        icon = Icons.ads_click;
        color = Colors.cyan;
        break;
      case 'SQL':
        icon = Icons.storage;
        color = Colors.deepOrange;
        break;
      case 'Networking':
        icon = Icons.router;
        color = Colors.indigo;
        break;
      case 'OS':
        icon = Icons.computer;
        color = Colors.blueGrey;
        break;
      case 'DSA':
        icon = Icons.schema;
        color = Colors.deepPurple;
        break;
      case 'Quantitative Aptitude':
        icon = Icons.calculate;
        color = Colors.pink;
        break;
      case 'Logical Reasoning':
        icon = Icons.psychology;
        color = Colors.indigoAccent;
        break;
      case 'Verbal Ability':
        icon = Icons.translate;
        color = Colors.amber;
        break;
      default:
        icon = Icons.quiz;
        color = Colors.grey;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => Get.toNamed('/quiz', arguments: category),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                category,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '${quizData[category]?.length ?? 0} Questions',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
