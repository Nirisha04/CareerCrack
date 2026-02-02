import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';

class AdminService extends BaseService {
  Future<void> addCategory(String title, String subtitle, String icon) async {
    await firestore.collection('learning_categories').add({
      'title': title,
      'description': subtitle,
      'icon': icon,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> addQuizQuestion(Map<String, dynamic> question) async {
    await firestore.collection('quiz_questions').add(question);
  }

  Future<void> addContent(
    String categoryId,
    String type,
    Map<String, dynamic> content,
  ) async {
    await firestore
        .collection('learning_categories')
        .doc(categoryId)
        .collection(type)
        .add(content);
  }
}
