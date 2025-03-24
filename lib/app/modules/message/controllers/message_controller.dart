import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Added Auth Instance

  var userData = {}.obs; // Observable map to hold user data

  @override
  void onInit() {
    super.onInit();
    User? user = _auth.currentUser; // Fetch the current user
    if (user != null) {
      fetchUserData(user.uid);
    } else {
      print("Error: No user is currently signed in.");
    }
  }

  Future<void> fetchUserData(String uid) async {
    if (uid.isEmpty) {
      print("Error: UID is empty or null.");
      return;
    }

    try {
      print("Fetching user data for UID: $uid");

      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists && userDoc.data() != null) {
        print("Firestore Document: ${userDoc.data()}");
        userData.value = userDoc.data()!;
        print("User Data Fetched Successfully: $userData");
      } else {
        print("User data not found for UID: $uid");
        Get.snackbar("Error", "User data not found");
      }
    } catch (e) {
      print("Error fetching user data: $e");
      Get.snackbar("Error", "Failed to fetch user data: ${e.toString()}");
    }
  }
}
