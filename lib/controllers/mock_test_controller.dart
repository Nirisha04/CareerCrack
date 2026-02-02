import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question_model.dart';

class MockTestController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Question> questions = <Question>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  RxBool isLoading = false.obs;
  RxBool showExplanation = false.obs;
  RxInt selectedAnswer = (-1).obs;
  RxInt timeLeft = 60.obs; // seconds per question for mock test
  RxInt level = 1.obs;
  RxInt streak = 0.obs;
  RxInt negativeMarks = 0.obs;
  RxInt correct = 0.obs;
  RxInt wrong = 0.obs;

  double get calculatedScore => correct.value - (wrong.value * 0.25);
  // Keep existing score observable for backward compatibility if needed,
  // but we should probably use calculatedScore.
  // However, existing view uses score.value (int).
  // I will update selectAnswer to update score as well for legacy view,
  // but primarily we care about the result View which uses the controller properties.

  @override
  void onInit() {
    super.onInit();
    loadMockTestQuestions();
  }

  Future<void> loadMockTestQuestions() async {
    try {
      isLoading.value = true;
      // Load mixed difficulty questions
      QuerySnapshot snapshot = await _firestore
          .collection('questions')
          .limit(20)
          .get();

      if (snapshot.docs.isEmpty) {
        await _addSampleQuestions();
        snapshot = await _firestore.collection('questions').limit(20).get();
      }

      questions.value = snapshot.docs
          .map((doc) => Question.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load questions');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _addSampleQuestions() async {
    // Same as quiz controller
    List<Question> sampleQuestions = [
      Question(
        id: '1',
        question: 'What is the capital of France?',
        options: ['London', 'Berlin', 'Paris', 'Madrid'],
        correctAnswerIndex: 2,
        explanation: 'Paris is the capital.',
        category: 'aptitude',
        difficulty: 'easy',
      ),
      Question(
        id: '2',
        question: 'Which language for Flutter?',
        options: ['Java', 'Dart', 'Python', 'C++'],
        correctAnswerIndex: 1,
        explanation: 'Dart is used.',
        category: 'programming',
        difficulty: 'easy',
      ),
      // Add more
    ];

    for (var question in sampleQuestions) {
      await _firestore
          .collection('questions')
          .doc(question.id)
          .set(question.toMap());
    }
  }

  void selectAnswer(int index) {
    selectedAnswer.value = index;
    showExplanation.value = true;
    if (index == questions[currentQuestionIndex.value].correctAnswerIndex) {
      score.value += 1;
      correct.value++;
      streak.value++;
    } else {
      score.value -= 0; // Don't change integer score for legacy view?
      // User provided formula: correct - wrong*0.25.
      // If I want to match User's formula, I should use calculatedScore in the UI.
      wrong.value++;
      negativeMarks.value++;
      streak.value = 0;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedAnswer.value = -1;
      showExplanation.value = false;
      timeLeft.value = 60;
    } else {
      // Test finished
      Get.toNamed(
        '/mock_test_result',
        arguments: {
          'score': score.value,
          'total': questions.length,
          'streak': streak.value,
          'negativeMarks': negativeMarks.value,
        },
      );
    }
  }

  void resetTest() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    selectedAnswer.value = -1;
    showExplanation.value = false;
    timeLeft.value = 60;
    streak.value = 0;
    correct.value = 0;
    wrong.value = 0;
    negativeMarks.value = 0;
  }
}
