class InterviewModel {
  final String id;
  final String title;
  final String category; // HR or Technical
  final String difficulty;
  final String question;

  InterviewModel({
    required this.id,
    required this.title,
    required this.category,
    required this.difficulty,
    required this.question,
  });

  factory InterviewModel.fromMap(String id, Map<String, dynamic> data) {
    return InterviewModel(
      id: id,
      title: data['title'] ?? '',
      category: data['category'] ?? '',
      difficulty: data['difficulty'] ?? '',
      question: data['question'] ?? '',
    );
  }
}
