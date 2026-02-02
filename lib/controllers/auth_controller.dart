import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _getReadableErrorMessage(String error) {
  if (error.contains('user-not-found')) {
    return 'No account found with this email.';
  } else if (error.contains('wrong-password')) {
    return 'Incorrect password.';
  } else if (error.contains('invalid-email')) {
    return 'Invalid email address.';
  } else if (error.contains('user-disabled')) {
    return 'This account has been disabled.';
  } else if (error.contains('too-many-requests')) {
    return 'Too many login attempts. Please try again later.';
  } else if (error.contains('email-already-in-use')) {
    return 'An account with this email already exists.';
  } else if (error.contains('weak-password')) {
    return 'Password is too weak. Please use a stronger password.';
  } else if (error.contains('operation-not-allowed')) {
    return 'Email/password accounts are not enabled.';
  }
  return error;
}

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        'Success',
        'Logged in successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Login Failed',
        _getReadableErrorMessage(e.message ?? e.code),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        _getReadableErrorMessage(e.toString()),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUpWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      isLoading.value = true;
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user!.updateDisplayName(name);
      await _firestore.collection('users').doc(result.user!.uid).set({
        'name': name,
        'email': email,
        'xp': 0,
        'level': 1,
        'streak': 0,
        'badges': [],
        'createdAt': FieldValue.serverTimestamp(),
      });
      Get.snackbar(
        'Success',
        'Account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Sign Up Failed',
        _getReadableErrorMessage(e.message ?? e.code),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        _getReadableErrorMessage(e.toString()),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      await _firestore.collection('users').doc(result.user!.uid).set({
        'name': result.user!.displayName,
        'email': result.user!.email,
        'xp': 0,
        'level': 1,
        'streak': 0,
        'badges': [],
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
      Get.snackbar(
        'Success',
        'Logged in with Google!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Google Sign-In Failed',
        _getReadableErrorMessage(e.message ?? e.code),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        _getReadableErrorMessage(e.toString()),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
