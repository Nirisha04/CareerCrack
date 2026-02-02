import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';
import '../models/analytics_model.dart';

class AnalyticsService extends BaseService {
  Future<List<AnalyticsModel>> fetchTopicAnalytics(String uid) async {
    final snapshot = await firestore
        .collection('users')
        .doc(uid)
        .collection('topic_stats')
        .get();

    return snapshot.docs.map((doc) {
      final d = doc.data();
      return AnalyticsModel(
        topic: d['topic'],
        correct: d['correct'],
        total: d['total'],
      );
    }).toList();
  }

  Future<void> updateTopicStats({
    required String uid,
    required String topic,
    required bool isCorrect,
  }) async {
    final ref = firestore
        .collection('users')
        .doc(uid)
        .collection('topic_stats')
        .doc(topic);

    await firestore.runTransaction((tx) async {
      final snap = await tx.get(ref);
      final correct = snap.exists ? snap['correct'] : 0;
      final total = snap.exists ? snap['total'] : 0;

      tx.set(ref, {
        'topic': topic,
        'correct': isCorrect ? correct + 1 : correct,
        'total': total + 1,
      }, SetOptions(merge: true));
    });
  }
}
