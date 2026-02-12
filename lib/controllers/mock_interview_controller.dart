import 'dart:async';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:camera/camera.dart';
import '../models/mock_interview_model.dart';
import '../utils/mock_interview_data.dart';

class MockInterviewController extends GetxController {
  var questions = <MockInterviewQuestion>[].obs;
  var currentQuestionIndex = 0.obs;
  var responses = <MockInterviewResponse>[].obs;
  var isLoading = false.obs;

  // Hardware related
  final AudioRecorder audioRecorder = AudioRecorder();
  CameraController? cameraController;
  var isCameraInitialized = false.obs;
  var isRecording = false.obs;

  // Timer related
  var remainingSeconds = 0.obs;
  Timer? _timer;

  // Scoring related
  var finalFeedback = Rxn<MockInterviewFeedback>();

  void startInterview(String category, String difficulty) {
    questions.value = MockInterviewData.getQuestionsByCategoryAndDifficulty(
      category,
      difficulty,
    );
    currentQuestionIndex.value = 0;
    responses.clear();
    finalFeedback.value = null;
    if (questions.isNotEmpty) {
      _startQuestionTimer();
    }
  }

  void _startQuestionTimer() {
    _timer?.cancel();
    remainingSeconds.value =
        questions[currentQuestionIndex.value].suggestedDurationSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        nextQuestion('No response recorded (Timed out)', ResponseType.text);
      }
    });
  }

  void nextQuestion(String content, ResponseType type) {
    _timer?.cancel();

    // Simple rule-based feedback for the specific question
    final feedback = _generateScore(
      content,
      type,
      questions[currentQuestionIndex.value],
    );

    responses.add(
      MockInterviewResponse(
        questionId: questions[currentQuestionIndex.value].id,
        content: content,
        type: type,
        timestamp: DateTime.now(),
        feedback: feedback,
      ),
    );

    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      _startQuestionTimer();
    } else {
      _finishInterview();
    }
  }

  MockInterviewFeedback _generateScore(
    String content,
    ResponseType type,
    MockInterviewQuestion question,
  ) {
    double communication = 7.0;
    double confidence = 7.0;
    double clarity = 7.0;
    List<String> strengths = [];
    List<String> improvements = [];

    if (type == ResponseType.text) {
      final wordCount = content.split(' ').length;
      if (wordCount < 10) {
        communication = 4.0;
        clarity = 5.0;
        improvements.add('Try to provide more detailed answers.');
      } else if (wordCount > 50) {
        communication = 9.0;
        strengths.add('Good depth in your answer.');
      } else {
        communication = 7.5;
        strengths.add('Concise and clear answer.');
      }
    } else {
      // Audio/Video recording - assuming content is path or descriptive
      confidence = 8.0;
      strengths.add('Used ${type.name} to express ideas.');
    }

    return MockInterviewFeedback(
      communicationScore: communication,
      confidenceScore: confidence,
      clarityScore: clarity,
      overallFeedback: 'Good effort on this question.',
      keyStrengths: strengths,
      areasForImprovement: improvements,
    );
  }

  void _finishInterview() {
    // Aggregate scores
    double totalComm = 0;
    double totalConf = 0;
    double totalClar = 0;

    for (var resp in responses) {
      if (resp.feedback != null) {
        totalComm += resp.feedback!.communicationScore;
        totalConf += resp.feedback!.confidenceScore;
        totalClar += resp.feedback!.clarityScore;
      }
    }

    final avgComm = totalComm / responses.length;
    final avgConf = totalConf / responses.length;
    final avgClar = totalClar / responses.length;

    finalFeedback.value = MockInterviewFeedback(
      communicationScore: double.parse(avgComm.toStringAsFixed(1)),
      confidenceScore: double.parse(avgConf.toStringAsFixed(1)),
      clarityScore: double.parse(avgClar.toStringAsFixed(1)),
      overallFeedback:
          'Interview session completed. You showed good potential!',
      keyStrengths: [
        'Consistent communication',
        'Good understanding of topics',
      ],
      areasForImprovement: [
        'Practice more on timed responses',
        'Deepen technical knowledge',
      ],
    );

    Get.toNamed('/mock_interview_feedback');
  }

  Future<bool> checkAndRequestPermissions(ResponseType type) async {
    if (type == ResponseType.audio) {
      var status = await Permission.microphone.request();
      if (status.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Required',
          'Please enable microphone access in settings.',
        );
        return false;
      }
      return status.isGranted;
    } else if (type == ResponseType.video) {
      var cameraStatus = await Permission.camera.request();
      var micStatus = await Permission.microphone.request();
      if (cameraStatus.isPermanentlyDenied || micStatus.isPermanentlyDenied) {
        Get.snackbar(
          'Permission Required',
          'Please enable camera and microphone access in settings.',
        );
        return false;
      }
      return cameraStatus.isGranted && micStatus.isGranted;
    }
    return true;
  }

  Future<void> initializeCamera() async {
    if (cameraController != null) return;

    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return;

      cameraController = CameraController(
        cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
          orElse: () => cameras.first,
        ),
        ResolutionPreset.medium,
      );

      await cameraController!.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      Get.snackbar('Camera Error', 'Failed to initialize camera: $e');
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    audioRecorder.dispose();
    cameraController?.dispose();
    super.onClose();
  }
}
