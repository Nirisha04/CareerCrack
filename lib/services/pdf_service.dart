import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';

class PdfService extends BaseService {
  Future<List<Map<String, dynamic>>> fetchPdfs(String categoryId) async {
    try {
      final snapshot = await firestore
          .collection('learning_categories')
          .doc(categoryId)
          .collection('pdfs')
          .orderBy('order')
          .get();

      return snapshot.docs.map((d) => d.data()).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<void> saveReadProgress({
    required String uid,
    required String pdfId,
    required double progress,
  }) async {
    await firestore
        .collection('users')
        .doc(uid)
        .collection('pdf_progress')
        .doc(pdfId)
        .set({
          'progress': progress,
          'updatedAt': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
  }
}
