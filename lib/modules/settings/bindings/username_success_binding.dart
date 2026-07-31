import 'package:get/get.dart';

import '../controllers/username_success_controller.dart';

class UsernameSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsernameSuccessController>(
      () => UsernameSuccessController(),
    );
  }
}