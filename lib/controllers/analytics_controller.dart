import 'package:get/get.dart';
import '../services/analytics_service.dart';
import '../models/analytics_model.dart';

class AnalyticsController extends GetxController {
  final _service = AnalyticsService();

  var stats = <AnalyticsModel>[].obs;
  var isLoading = false.obs;

  void loadAnalytics(String uid) async {
    isLoading.value = true;
    try {
      stats.value = await _service.fetchTopicAnalytics(uid);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTopicStats({
    required String uid,
    required String topic,
    required bool isCorrect,
  }) async {
    await _service.updateTopicStats(
      uid: uid,
      topic: topic,
      isCorrect: isCorrect,
    );
    // Refresh local stats if needed or just let next load handle it?
    // User snippet doesn't show manual refresh, but good practice to keep state arguably.
    // However, for now, let's stick to the requested interface.
  }

  List<AnalyticsModel> get strengths =>
      stats.where((e) => e.accuracy >= 70).toList();

  List<AnalyticsModel> get weaknesses =>
      stats.where((e) => e.accuracy < 40).toList();
}
