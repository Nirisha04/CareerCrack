import 'package:get/get.dart';
import '../services/notification_service.dart';

class NotificationController extends GetxController {
  final _service = NotificationService();

  @override
  void onInit() {
    super.onInit();
    _service.init();
    _service.scheduleDailyReminder();
  }

  void sendCustomNotification(String title, String body) {
    _service.showNotification(title, body);
  }
}
