import 'package:get/get.dart';

import '../controllers/onboarding_two_controller.dart';

class OnboardingTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingTwoController>(
      () => OnboardingTwoController(),
    );
  }
}
