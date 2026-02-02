import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/learning_model.dart';
import 'base_service.dart';

class LearningServiceEnhanced extends BaseService {

  /// Fetch learning categories
  Future<List<LearningCategory>> getCategories() async {
    try {
      final snapshot =
          await firestore.collection('learning_categories').get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return LearningCategory(
          id: doc.id,
          title: data['title'],
          subtitle: data['description'],
          icon: data['icon'],
          progress: (data['progress'] ?? 0).toDouble(),
        );
      }).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  /// Fetch content (notes / videos / pdfs)
  Future<List<Map<String, dynamic>>> getContent({
    required String categoryId,
    required String contentType,
  }) async {
    try {
      final snapshot = await firestore
          .collection('learning_categories')
          .doc(categoryId)
          .collection(contentType)
          .orderBy('order', descending: false)
          .get();

      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  /// Update topic completion
  Future<void> markTopicCompleted({
    required String uid,
    required String categoryId,
    required String topicId,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('learning_progress')
          .doc('$categoryId-$topicId')
          .set({
        'categoryId': categoryId,
        'topicId': topicId,
        'completed': true,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw handleError(e);
    }
  }

  /// Update category progress
  Future<void> updateCategoryProgress({
    required String uid,
    required String categoryId,
    required double progress,
  }) async {
    try {
      await firestore
          .collection('users')
          .doc(uid)
          .collection('category_progress')
          .doc(categoryId)
          .set({
        'progress': progress,
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw handleError(e);
    }
  }
}
