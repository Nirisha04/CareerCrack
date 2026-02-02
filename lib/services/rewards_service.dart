import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_service.dart';

class RewardsService extends BaseService {
  Future<void> updateXP({required String uid, required int xpEarned}) async {
    final userRef = firestore.collection('users').doc(uid);

    await firestore.runTransaction((tx) async {
      final snap = await tx.get(userRef);
      // Ensure data exists or default to 0
      final data = snap.data();
      final currentXP = (data != null && data.containsKey('xp'))
          ? data['xp'] as int
          : 0;
      final newXP = currentXP + xpEarned;

      tx.update(userRef, {
        'xp': newXP,
        'level': _calculateLevel(newXP),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    });
  }

  int _calculateLevel(int xp) {
    return (xp / 100).floor() + 1;
  }

  Future<void> updateStreak(String uid) async {
    final ref = firestore.collection('users').doc(uid);

    await firestore.runTransaction((tx) async {
      final snap = await tx.get(ref);
      final data = snap.data();
      if (data == null) {
        return; // Should likely create if not exists, but simpler for now.
      }

      final lastDateTimestamp = data['lastActiveDate'] as Timestamp?;
      final lastDate = lastDateTimestamp?.toDate();
      final currentStreak = (data.containsKey('streak'))
          ? data['streak'] as int
          : 0;

      final today = DateTime.now();
      // Reset time component for accurate day comparison if needed,
      // but 'difference' with serverTimestamp needs care.
      // User logic: if diff > 1 streak = 1. if diff == 1 streak++.

      // Basic day check (ignoring exact hours for simplicity based on user snippet)
      // Usually users want calendar days.
      // But adhering to snippet logic:

      if (lastDate == null) {
        tx.update(ref, {
          'streak': 1,
          'lastActiveDate': FieldValue.serverTimestamp(),
        });
        return;
      }

      final difference = today.difference(lastDate).inDays;

      if (difference > 1) {
        tx.update(ref, {'streak': 1});
      } else if (difference >= 1) {
        // 1 day difference
        tx.update(ref, {'streak': currentStreak + 1});
      }
      // if 0 days (same day), do nothing or update lastActiveDate?
      // User snippet updates lastActiveDate always.

      tx.update(ref, {'lastActiveDate': FieldValue.serverTimestamp()});
    });
  }
}
