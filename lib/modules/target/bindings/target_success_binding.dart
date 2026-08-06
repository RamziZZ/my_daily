import 'package:get/get.dart';
import '../controllers/target_success_controller.dart';

class TargetSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TargetSuccessController>(
      () => TargetSuccessController(),
    );
  }
}