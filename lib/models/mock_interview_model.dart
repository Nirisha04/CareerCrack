class MockInterviewQuestion {
  final String id;
  final String text;
  final String category; // HR, Technical, Behavioral
  final String difficulty; // Easy, Medium, Hard
  final int suggestedDurationSeconds;

  MockInterviewQuestion({
    required this.id,
    required this.text,
    required this.category,
    required this.difficulty,
    this.suggestedDurationSeconds = 60,
  });

  factory MockInterviewQuestion.fromMap(Map<String, dynamic> map) {
    return MockInterviewQuestion(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      category: map['category'] ?? 'HR',
      difficulty: map['difficulty'] ?? 'Easy',
      suggestedDurationSeconds: map['suggestedDurationSeconds'] ?? 60,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'category': category,
      'difficulty': difficulty,
      'suggestedDurationSeconds': suggestedDurationSeconds,
    };
  }
}

class MockInterviewFeedback {
  final double communicationScore; // 0.0 to 10.0
  final double confidenceScore;
  final double clarityScore;
  final String overallFeedback;
  final List<String> keyStrengths;
  final List<String> areasForImprovement;

  MockInterviewFeedback({
    required this.communicationScore,
    required this.confidenceScore,
    required this.clarityScore,
    required this.overallFeedback,
    required this.keyStrengths,
    required this.areasForImprovement,
  });

  factory MockInterviewFeedback.fromMap(Map<String, dynamic> map) {
    return MockInterviewFeedback(
      communicationScore: (map['communicationScore'] ?? 0.0).toDouble(),
      confidenceScore: (map['confidenceScore'] ?? 0.0).toDouble(),
      clarityScore: (map['clarityScore'] ?? 0.0).toDouble(),
      overallFeedback: map['overallFeedback'] ?? '',
      keyStrengths: List<String>.from(map['keyStrengths'] ?? []),
      areasForImprovement: List<String>.from(map['areasForImprovement'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'communicationScore': communicationScore,
      'confidenceScore': confidenceScore,
      'clarityScore': clarityScore,
      'overallFeedback': overallFeedback,
      'keyStrengths': keyStrengths,
      'areasForImprovement': areasForImprovement,
    };
  }
}

enum ResponseType { text, audio, video }

class MockInterviewResponse {
  final String questionId;
  final String content; // Text answer or path to audio/video
  final ResponseType type;
  final DateTime timestamp;
  final MockInterviewFeedback? feedback;

  MockInterviewResponse({
    required this.questionId,
    required this.content,
    required this.type,
    required this.timestamp,
    this.feedback,
  });

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'content': content,
      'type': type.name,
      'timestamp': timestamp.toIso8601String(),
      'feedback': feedback?.toMap(),
    };
  }
}
