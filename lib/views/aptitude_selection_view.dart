import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AptitudeSelectionView extends StatelessWidget {
  const AptitudeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'title': 'Quantitative Aptitude',
        'icon': Icons.calculate,
        'color': Colors.pink,
        'topics': ['Arithmetic', 'Algebra', 'Geometry', 'Data Interpretation'],
        'description': 'Numbers, Profit & Loss, Time & Work, etc.',
      },
      {
        'title': 'Logical Reasoning',
        'icon': Icons.psychology,
        'color': Colors.indigoAccent,
        'topics': [
          'Syllogism',
          'Blood Relations',
          'Coding-Decoding',
          'Seating Arrangement',
        ],
        'description': 'Puzzles, Series, Direction sense, etc.',
      },
      {
        'title': 'Verbal Ability',
        'icon': Icons.translate,
        'color': Colors.amber,
        'topics': [
          'Grammar',
          'Vocabulary',
          'Reading Comprehension',
          'Parajumbles',
        ],
        'description': 'Synonyms, Antonyms, Fill in the blanks, etc.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aptitude & Reasoning'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              onTap: () => Get.toNamed('/aptitude_detail', arguments: section),
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: (section['color'] as Color).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        section['icon'] as IconData,
                        size: 40,
                        color: section['color'] as Color,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            section['title'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            section['description'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            children: (section['topics'] as List<String>)
                                .take(2)
                                .map(
                                  (t) => Chip(
                                    label: Text(
                                      t,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    padding: EdgeInsets.zero,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
