class Question {
  String id;
  String question;
  String? codeSnippet;
  String? language;
  List<String> options;
  int correctAnswerIndex;
  String explanation;
  String category;
  String difficulty; // easy, medium, hard

  Question({
    required this.id,
    required this.question,
    this.codeSnippet,
    this.language,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.category,
    required this.difficulty,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      codeSnippet: map['codeSnippet'],
      language: map['language'],
      options: List<String>.from(map['options'] ?? []),
      correctAnswerIndex: map['correctAnswerIndex'] ?? 0,
      explanation: map['explanation'] ?? '',
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? 'easy',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'codeSnippet': codeSnippet,
      'language': language,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
      'explanation': explanation,
      'category': category,
      'difficulty': difficulty,
    };
  }
}
