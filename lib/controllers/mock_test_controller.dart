import 'package:get/get.dart';
import 'dart:async';
import '../models/question_model.dart';
import '../utils/quiz_data.dart';
import 'auth_controller.dart';
import 'rewards_controller.dart';

class MockTestController extends GetxController {
  RxList<Question> questions = <Question>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  RxBool isLoading = false.obs;
  RxBool showExplanation = false.obs;
  RxInt selectedAnswer = (-1).obs;
  RxInt timeLeft = 60.obs;
  RxInt level = 1.obs;
  RxInt streak = 0.obs;
  RxInt xp = 0.obs;
  RxInt correct = 0.obs;
  RxInt wrong = 0.obs;

  // Performance tracking
  RxMap<String, int> categoryCorrect = <String, int>{}.obs;
  RxMap<String, int> categoryTotal = <String, int>{}.obs;
  RxList<int> questionTimes = <int>[].obs;
  DateTime? _questionStartTime;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    loadMockTestQuestions();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer?.cancel();
    timeLeft.value = 60;
    _questionStartTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
        _handleTimeUp();
      }
    });
  }

  void _handleTimeUp() {
    if (!showExplanation.value) {
      selectAnswer(-1); // Mark as wrong/skipped
    }
  }

  Future<void> loadMockTestQuestions() async {
    try {
      isLoading.value = true;
      List<Question> allQuestions = [];

      // Load all questions from quizData
      quizData.forEach((category, list) {
        for (var q in list) {
          allQuestions.add(
            Question(
              id:
                  DateTime.now().millisecondsSinceEpoch.toString() +
                  allQuestions.length.toString(),
              question: q['question'],
              codeSnippet: q['codeSnippet'],
              language: q['language'],
              options: List<String>.from(q['options']),
              correctAnswerIndex: q['options'].indexOf(q['answer']),
              explanation: q['explanation'] ?? 'No explanation provided.',
              category: category,
              difficulty: q['difficulty'],
            ),
          );
        }
      });

      allQuestions.shuffle();
      // Take 20 random questions for the mock test
      questions.value = allQuestions.take(20).toList();
      startTimer();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load questions: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectAnswer(int index) {
    if (showExplanation.value) return;

    _timer?.cancel();
    selectedAnswer.value = index;
    showExplanation.value = true;

    // Track time taken
    if (_questionStartTime != null) {
      questionTimes.add(
        DateTime.now().difference(_questionStartTime!).inSeconds,
      );
    }

    Question currentQ = questions[currentQuestionIndex.value];
    String cat = currentQ.category;
    categoryTotal[cat] = (categoryTotal[cat] ?? 0) + 1;

    if (index == currentQ.correctAnswerIndex) {
      score.value += 1;
      correct.value++;
      streak.value++;
      categoryCorrect[cat] = (categoryCorrect[cat] ?? 0) + 1;

      // XP Logic: 10 base + streak bonus
      int gainedXp = 10 + (streak.value > 5 ? 5 : 0);
      xp.value += gainedXp;
    } else {
      wrong.value++;
      streak.value = 0;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = -1;
      showExplanation.value = false;
      startTimer();
    } else {
      _finishTest();
    }
  }

  void _finishTest() {
    _timer?.cancel();
    final authController = Get.find<AuthController>();
    final rewardsController = Get.find<RewardsController>();
    final userId = authController.user.value?.uid;

    if (userId != null) {
      // Persist XP to user profile
      rewardsController.earnXP(userId, xp.value);
      // Update the main daily streak if they completed a test
      rewardsController.updateDailyStreak(userId);
    }

    Get.offNamed(
      '/mock_test_result',
      arguments: {
        'score': score.value,
        'total': questions.length,
        'streak': streak.value,
        'xp': xp.value,
        'correct': correct.value,
        'wrong': wrong.value,
        'categoryPerf': categoryCorrect,
        'categoryTotal': categoryTotal,
        'avgTime': questionTimes.isEmpty
            ? 0
            : (questionTimes.reduce((a, b) => a + b) / questionTimes.length)
                  .round(),
      },
    );
  }

  double get calculatedScore => correct.value - (wrong.value * 0.25);

  void resetTest() {
    _timer?.cancel();
    currentQuestionIndex.value = 0;
    score.value = 0;
    selectedAnswer.value = -1;
    showExplanation.value = false;
    streak.value = 0;
    correct.value = 0;
    wrong.value = 0;
    xp.value = 0;
    categoryCorrect.clear();
    categoryTotal.clear();
    questionTimes.clear();
    loadMockTestQuestions();
  }
}
