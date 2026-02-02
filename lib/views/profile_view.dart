import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/auth_controller.dart';
import '../models/user_model.dart';

class ProfileView extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(authController.user.value!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('User data not found'));
          }

          UserModel user = UserModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.name}', style: const TextStyle(fontSize: 18)),
                Text('Email: ${user.email}', style: const TextStyle(fontSize: 18)),
                Text('XP: ${user.xp}', style: const TextStyle(fontSize: 18)),
                Text('Level: ${user.level}', style: const TextStyle(fontSize: 18)),
                Text('Streak: ${user.streak}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                const Text('Badges:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Wrap(
                  children: user.badges.map((badge) => Chip(label: Text(badge))).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}