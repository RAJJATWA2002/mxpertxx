import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    final MessageController controller = Get.put(MessageController());
    final String uid = Get.arguments ?? ""; // Get UID from navigation

    // Run fetchUserData AFTER build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (uid.isNotEmpty) {
        controller.fetchUserData(uid);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('MessageView'), centerTitle: true),
      body: Obx(() {
        if (controller.userData.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email: ${controller.userData['email']}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Phone: ${controller.userData['phone']}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                "Created At: ${controller.userData['createdAt']?.toDate()}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }),
    );
  }
}
