import 'package:get/get.dart';
import '../services/admin_service.dart';

class AdminController extends GetxController {
  final _service = AdminService();

  var isLoading = false.obs;

  Future<void> createCategory(
    String title,
    String subtitle,
    String icon,
  ) async {
    try {
      isLoading(true);
      await _service.addCategory(title, subtitle, icon);
      Get.snackbar('Success', 'Category added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add category');
    } finally {
      isLoading(false);
    }
  }

  Future<void> createQuiz(Map<String, dynamic> question) async {
    try {
      isLoading(true);
      await _service.addQuizQuestion(question);
      Get.snackbar('Success', 'Quiz question added');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add quiz question');
    } finally {
      isLoading(false);
    }
  }

  Future<void> uploadContent(
    String categoryId,
    String type,
    Map<String, dynamic> content,
  ) async {
    try {
      isLoading(true);
      await _service.addContent(categoryId, type, content);
      Get.snackbar('Success', 'Content added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add content');
    } finally {
      isLoading(false);
    }
  }
}
