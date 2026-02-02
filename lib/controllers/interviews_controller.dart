import 'package:get/get.dart';
import '../services/interviews_service.dart';
import '../models/interview_model.dart';

class InterviewsController extends GetxController {
  final _service = InterviewsService();

  var interviews = <InterviewModel>[].obs;
  var isLoading = false.obs;

  void loadInterviews(String category) async {
    try {
      isLoading(true);
      interviews.value = await _service.fetchInterviews(category);
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitAnswer(
    String uid,
    String interviewId,
    String answer,
  ) async {
    await _service.submitAnswer(
      uid: uid,
      interviewId: interviewId,
      answer: answer,
    );
  }
}
