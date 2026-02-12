import 'dart:async';
import 'package:get/get.dart';
import '../services/quiz_service.dart';
import 'rewards_controller.dart';
import 'analytics_controller.dart';
import 'auth_controller.dart';
import '../utils/quiz_data.dart';

class QuizController extends GetxController {
  final _service = QuizService();

  var questions = <Map<String, dynamic>>[].obs;
  var currentIndex = 0.obs;
  var score = 0.obs;
  var timeLeft = 30.obs;
  var isAnswered = false.obs;
  var selectedAnswer = ''.obs;
  var isCorrectAnswer = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  String currentCategory = '';

  // Mapping sub-topics to parent categories if local data is organized by parent
  final Map<String, String> _topicToCategory = {
    'Arithmetic': 'Quantitative Aptitude',
    'Algebra': 'Quantitative Aptitude',
    'Geometry': 'Quantitative Aptitude',
    'Data Interpretation': 'Quantitative Aptitude',
    'Syllogism': 'Logical Reasoning',
    'Blood Relations': 'Logical Reasoning',
    'Coding-Decoding': 'Logical Reasoning',
    'Seating Arrangement': 'Logical Reasoning',
    'Grammar': 'Verbal Ability',
    'Vocabulary': 'Verbal Ability',
    'Reading Comprehension': 'Verbal Ability',
    'Parajumbles': 'Verbal Ability',
  };

  Timer? _timer;

  void startQuiz(
    String category, {
    bool onlyCoding = false,
    String? difficulty,
  }) async {
    _timer?.cancel();
    currentCategory = category;
    currentIndex.value = 0;
    score.value = 0;
    isAnswered.value = false;
    selectedAnswer.value = '';
    questions.clear();
    isLoading.value = true;
    errorMessage.value = '';

    try {
      String lookupCategory = category;

      // check if category is a sub-topic
      if (!quizData.containsKey(category) &&
          _topicToCategory.containsKey(category)) {
        lookupCategory = _topicToCategory[category]!;
      }

      // Check if we have local data for this category
      if (quizData.containsKey(lookupCategory)) {
        var localQuestions = List<Map<String, dynamic>>.from(
          quizData[lookupCategory]!,
        );

        // If it was a sub-topic, try to filter by that sub-topic if questions have a 'topic' or 'subCategory' field
        // or just use the parent category data as a fallback.
        // Based on the user's previous request, they merged them, so we just use the parent questions.

        if (onlyCoding) {
          localQuestions = localQuestions
              .where((q) => q['codeSnippet'] != null)
              .toList();
        }

        if (difficulty != null) {
          localQuestions = localQuestions
              .where((q) => q['difficulty'] == difficulty.toLowerCase())
              .toList();
        }

        localQuestions.shuffle();
        // Limit to 10-15 questions for better responsiveness
        questions.value = localQuestions.take(15).toList();
      } else {
        // Fetch from firestore with a timeout
        final fetchedQuestions = await _service
            .fetchQuestions(
              category: category,
              difficulty: difficulty ?? 'medium',
            )
            .timeout(
              const Duration(seconds: 10),
              onTimeout: () {
                throw TimeoutException(
                  'Fetching questions took too long. Please check your connection.',
                );
              },
            );
        questions.value = fetchedQuestions;
      }

      if (questions.isEmpty) {
        errorMessage.value = 'No questions found for "$category".';
      } else {
        startTimer();
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void startTimer() {
    _timer?.cancel();
    timeLeft.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value == 0) {
        timer.cancel();
        if (!isAnswered.value) {
          answer(''); // Mark as skipped
        }
      } else {
        timeLeft.value--;
      }
    });
  }

  void answer(String selected) {
    if (isAnswered.value) return;

    _timer?.cancel();
    isAnswered.value = true;
    selectedAnswer.value = selected;

    final correctAnswer = questions[currentIndex.value]['answer'];
    isCorrectAnswer.value = selected == correctAnswer;

    if (isCorrectAnswer.value) {
      score.value++;
    }

    // Update Analytics
    final authController = Get.find<AuthController>();
    final userId = authController.user.value?.uid;
    if (userId != null) {
      final analytics = Get.put(AnalyticsController());
      String topic = questions[currentIndex.value]['category'] ?? 'General';
      analytics.updateTopicStats(
        uid: userId,
        topic: topic,
        isCorrect: isCorrectAnswer.value,
      );
    }
  }

  void goToNextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      isAnswered.value = false;
      selectedAnswer.value = '';
      startTimer();
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final authController = Get.find<AuthController>();
    final userId = authController.user.value?.uid;

    if (userId != null) {
      final rewards = Get.put(RewardsController());
      rewards.earnXP(userId, score.value * 10);
      rewards.updateDailyStreak(userId);

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
