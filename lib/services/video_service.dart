import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';

class VideoService extends BaseService {
  Future<List<Map<String, dynamic>>> fetchVideos(String categoryId) async {
    try {
      final snapshot = await firestore
          .collection('learning_categories')
          .doc(categoryId)
          .collection('videos')
          .orderBy('order')
          .get();

      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<void> saveWatchProgress({
    required String uid,
    required String videoId,
    required double progress,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('video_progress')
        .doc(videoId)
        .set({
          'progress': progress,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }
}
