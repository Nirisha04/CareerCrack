class AnalyticsModel {
  final String topic;
  final int correct;
  final int total;

  AnalyticsModel({
    required this.topic,
    required this.correct,
    required this.total,
  });

  double get accuracy => total == 0 ? 0 : (correct / total) * 100;

  factory AnalyticsModel.fromMap(Map<String, dynamic> data) {
    return AnalyticsModel(
      topic: data['topic'] ?? '',
      correct: data['correct'] ?? 0,
      total: data['total'] ?? 0,
    );
  }
}
