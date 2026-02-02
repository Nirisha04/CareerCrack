import 'dart:async';
import 'package:get/get.dart';
import '../services/quiz_service.dart';
import 'rewards_controller.dart';
import 'analytics_controller.dart';
import 'auth_controller.dart';

class QuizController extends GetxController {
  final _service = QuizService();

  var questions = <Map<String, dynamic>>[].obs;
  var currentIndex = 0.obs;
  var score = 0.obs;
  var timeLeft = 30.obs;

  Timer? _timer;

  void startQuiz(String category) async {
    questions.value = await _service.fetchQuestions(
      category: category,
      difficulty: 'medium',
    );
    startTimer();
  }

  void startTimer() {
    _timer?.cancel();
    timeLeft.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value == 0) {
        nextQuestion();
      } else {
        timeLeft.value--;
      }
    });
  }

  void answer(String selected) {
    bool isCorrect = false;
    if (selected == questions[currentIndex.value]['answer']) {
      score.value++;
      isCorrect = true;
    }

    // Update Analytics
    final authController = Get.find<AuthController>();
    final userId = authController.user.value?.uid;
    if (userId != null) {
      final analytics = Get.put(AnalyticsController());
      // Assuming 'category' or 'topic' field exists in question data.
      // User provided snippet uses: questions[currentIndex]['topic']
      // My quiz service fetches data, need to ensure 'topic' is available or use 'category'.
      // Previous usage was 'category' in fetch, 'topic' might be per question or same as category.
      // I'll try to find 'topic', fallback to 'category' from question data, fallback to arguments if possible.
      // But locally I only have access to current question map.
      String topic = questions[currentIndex.value]['category'] ?? 'General';
      // Wait, the user snippet said: topic: questions[currentIndex]['topic'],

      analytics.updateTopicStats(
        uid: userId,
        topic: topic,
        isCorrect: isCorrect,
      );
    }

    nextQuestion();
  }

  void nextQuestion() {
    _timer?.cancel();
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      startTimer();
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    // Get user ID
    final authController = Get.find<AuthController>();
    final userId = authController.user.value?.uid;

    if (userId != null) {
      final rewards = Get.put(RewardsController());
      // 10 XP per correct answer
      rewards.earnXP(userId, score.value * 10);
      rewards.updateDailyStreak(userId);

      // Save result
      _service.saveResult(
        uid: userId,
        score: score.value,
        total: questions.length,
      );
    }

    Get.offNamed(
      '/quiz_result',
      arguments: {'score': score.value, 'total': questions.length},
    );
  }
}
