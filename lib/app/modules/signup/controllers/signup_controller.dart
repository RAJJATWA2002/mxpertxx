import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertz/app/routes/app_pages.dart';
import 'package:mxpertz/common/colors.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  RxBool isPasswordVisibles = false.obs;
  RxBool isPasswordVisibler = false.obs;
  RxString phoneCode = '244'.obs;
  RxString countryFlag = '🇦🇴'.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            );

        String uid = userCredential.user!.uid;

        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'phone': phoneController.text.trim(),
          'phoneCode': '${phoneCode.value}',
          'createdAt': FieldValue.serverTimestamp(),
        });

        Get.snackbar(
          "Success",
          "User Registered Successfully!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primaryColor,
          colorText: Colors.white,
        );
        await Future.delayed(Duration(seconds: 2), () {
          Get.toNamed(Routes.LOGIN);
        });
      } catch (e) {
        print('Error: ${e}');
        Get.snackbar(
          "Failed",
          "Registration Failed: ${e.toString()}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Please fill all fields!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateCountry(Country country) {
    phoneCode.value = country.phoneCode;
    countryFlag.value = getCountryFlag(country.countryCode);
  }

  String getCountryFlag(String countryCode) {
    return countryCode
        .toUpperCase()
        .codeUnits
        .map((e) => String.fromCharCode(e + 127397))
        .join();
  }
}
