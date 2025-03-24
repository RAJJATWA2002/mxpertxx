import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../common/auth_controller.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final loginformkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount == null) return;

      final GoogleSignInAuthentication googleSignInAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuth.idToken,
        accessToken: googleSignInAuth.accessToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      Get.snackbar("Success", "Google Sign-In Successful!");
      final User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        AuthController.instance.firebaseUser.value = firebaseUser;
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (context) => Center(child: CircularProgressIndicator()),
        );
        Get.back();
        Get.offAllNamed(Routes.NAVBAR); // Navigate to Home Page
      }
    } on FirebaseAuthException catch (e) {
      _showErrorSnackBar(e.message ?? 'Something went wrong');
    } catch (e) {
      _showErrorSnackBar('Error: ${e.toString()}');
    }
  }

  void _showErrorSnackBar(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
