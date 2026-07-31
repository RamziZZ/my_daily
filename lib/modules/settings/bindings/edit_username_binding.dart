import 'package:get/get.dart';

import '../controllers/edit_username_controller.dart';

class EditUsernameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditUsernameController>(
      () => EditUsernameController(),
    );
  }
}