import 'package:get/get.dart';
import '../services/pdf_service.dart';

class PdfController extends GetxController {
  final _service = PdfService();

  var pdfs = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  Future<void> loadPdfs(String categoryId) async {
    try {
      isLoading(true);
      pdfs.value = await _service.fetchPdfs(categoryId);
    } finally {
      isLoading(false);
    }
  }
}
