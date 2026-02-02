import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/learning_model.dart';

class LearningService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch learning categories
  Future<List<LearningCategory>> fetchCategories() async {
    final snapshot = await _firestore
        .collection('learning_categories')
        .get();

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
  }

  /// Fetch content (notes / videos / pdfs)
  Future<List<Map<String, dynamic>>> fetchContent({
    required String categoryId,
    required String type, // notes | videos | pdfs
  }) async {
    final snapshot = await _firestore
        .collection('learning_categories')
        .doc(categoryId)
        .collection(type)
        .get();

    return snapshot.docs.map((e) => e.data()).toList();
  }

  /// Update user progress
  Future<void> updateProgress({
    required String uid,
    required String categoryId,
    required double progress,
  }) async {
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('progress')
        .doc(categoryId)
        .set({
      'progress': progress,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
