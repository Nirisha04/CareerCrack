import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class BaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Exception handleError(Object e) {
    if (kDebugMode) {
      debugPrint('SERVICE ERROR: $e');
    }
    return Exception('Something went wrong. Try again.');
  }
}
