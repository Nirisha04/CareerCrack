import 'package:get/get.dart';
import '../services/video_service.dart';

class VideoController extends GetxController {
  final _service = VideoService();

  var videos = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  Future<void> loadVideos(String categoryId) async {
    try {
      isLoading(true);
      videos.value = await _service.fetchVideos(categoryId);
    } finally {
      isLoading(false);
    }
  }
}
