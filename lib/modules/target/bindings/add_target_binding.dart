// add_target_binding.dart

import 'package:get/get.dart';
import '../controllers/add_target_controller.dart';

class AddTargetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTargetController>(
      () => AddTargetController(),
    );
  }
}