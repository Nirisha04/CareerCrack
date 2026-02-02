import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';
import '../models/interview_model.dart';

class InterviewsService extends BaseService {
  Future<List<InterviewModel>> fetchInterviews(String category) async {
    final snapshot = await firestore
        .collection('interviews')
        .where('category', isEqualTo: category)
        .orderBy('difficulty')
        .get();

    return snapshot.docs
        .map((doc) => InterviewModel.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> submitAnswer({
    required String uid,
    required String interviewId,
    required String answer,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('interview_answers')
        .doc(interviewId)
        .set({
          'answer': answer,
          'submittedAt': FieldValue.serverTimestamp(),
          'feedback': null,
        });
  }

  Future<void> submitFeedback({
    required String uid,
    required String interviewId,
    required String feedback,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('interview_answers')
        .doc(interviewId)
        .update({'feedback': feedback});
  }
}
