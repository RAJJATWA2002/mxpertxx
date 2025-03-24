import 'package:get/get.dart';

import '../controllers/onboarding_one_controller.dart';

class OnboardingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingOneController>(
      () => OnboardingOneController(),
    );
  }
}
