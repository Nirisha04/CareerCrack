import 'package:get/get.dart';
import '../models/learning_model.dart';
import '../services/learning_service_enhanced.dart';

class LearningController extends GetxController {
  final _service = LearningServiceEnhanced();

  var categories = <LearningCategory>[].obs;
  var isLoading = false.obs;

  Future<void> loadCategories() async {
    try {
      isLoading(true);
      categories.value = await _service.getCategories();
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    loadCategories();
    super.onInit();
  }
}
