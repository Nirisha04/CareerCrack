import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';

class QuizService extends BaseService {
  Future<List<Map<String, dynamic>>> fetchQuestions({
    required String category,
    required String difficulty,
    int limit = 10,
  }) async {
    try {
      final snapshot = await firestore
          .collection('quiz_questions')
          .where('category', isEqualTo: category)
          .where('difficulty', isEqualTo: difficulty)
          .limit(limit)
          .get();

      return snapshot.docs.map((d) => d.data()).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<void> saveResult({
    required String uid,
    required int score,
    required int total,
  }) async {
    await firestore.collection('users').doc(uid).collection('quiz_results').add(
      {
        'score': score,
        'total': total,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
  }
}
