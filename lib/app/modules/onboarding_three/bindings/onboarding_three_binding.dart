import 'package:get/get.dart';

import '../controllers/onboarding_three_controller.dart';

class OnboardingThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingThreeController>(
      () => OnboardingThreeController(),
    );
  }
}
