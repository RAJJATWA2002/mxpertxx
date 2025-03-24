import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../common/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = AuthController.instance.user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.signOut();
              Get.offNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
      body: Center(
        child:
            user != null
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          user.photoURL != null
                              ? NetworkImage(user.photoURL!)
                              : null,
                      child:
                          user.photoURL == null
                              ? Icon(Icons.person, size: 40)
                              : null,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Name: ${user.displayName ?? "N/A"}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Email: ${user.email ?? "N/A"}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                  ],
                )
                : Text("No user logged in"),
      ),
    );
  }
}
