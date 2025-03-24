import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/private_controller.dart';

class PrivateView extends GetView<PrivateController> {
  const PrivateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrivateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrivateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
