import 'package:get/get.dart';

import '../controllers/private_controller.dart';

class PrivateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivateController>(
      () => PrivateController(),
    );
  }
}
