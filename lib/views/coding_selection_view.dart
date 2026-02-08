import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/quiz_data.dart';

class CodingSelectionView extends StatefulWidget {
  const CodingSelectionView({super.key});

  @override
  State<CodingSelectionView> createState() => _CodingSelectionViewState();
}

class _CodingSelectionViewState extends State<CodingSelectionView> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedLanguage == null
              ? 'Select Language'
              : 'Select $selectedLanguage Difficulty',
        ),
        centerTitle: true,
        leading: selectedLanguage != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => setState(() => selectedLanguage = null),
              )
            : null,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: selectedLanguage == null
            ? _buildLanguageGrid()
            : _buildDifficultySelection(),
      ),
    );
  }

  Widget _buildLanguageGrid() {
    final languages = ['C', 'C++', 'Java', 'Python'];
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final lang = languages[index];
        return _buildLanguageCard(lang);
      },
    );
  }

  Widget _buildLanguageCard(String lang) {
    IconData icon;
    Color color;

    switch (lang) {
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
      default:
        icon = Icons.quiz;
        color = Colors.grey;
    }

    int count =
        quizData[lang]?.where((q) => q['codeSnippet'] != null).length ?? 0;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => setState(() => selectedLanguage = lang),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 12),
              Text(
                lang,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count Tasks',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultySelection() {
    final levels = [
      {'level': 'Easy', 'color': Colors.green, 'icon': Icons.bolt_outlined},
      {'level': 'Medium', 'color': Colors.orange, 'icon': Icons.bolt},
      {'level': 'Hard', 'color': Colors.red, 'icon': Icons.flash_on},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: levels.length,
      itemBuilder: (context, index) {
        final level = levels[index];
        final levelName = level['level'] as String;

        // Specific count for this difficulty
        int count =
            quizData[selectedLanguage!]
                ?.where(
                  (q) =>
                      q['codeSnippet'] != null &&
                      q['difficulty'] == levelName.toLowerCase(),
                )
                .length ??
            0;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: (level['color'] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  level['icon'] as IconData,
                  color: level['color'] as Color,
                ),
              ),
              title: Text(
                levelName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('$count $selectedLanguage Challenges available'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.toNamed(
                  '/quiz',
                  arguments: {
                    'category': selectedLanguage,
                    'mode': 'coding',
                    'difficulty': levelName,
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
