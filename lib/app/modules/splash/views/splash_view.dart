import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/image_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.increment();
      return SafeArea(
        child: Scaffold(
          body: Center(child: Image.asset(ImageConstants.splash)),
        ),
      );
    });
  }
}
