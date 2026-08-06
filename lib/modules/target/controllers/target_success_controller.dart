import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../controllers/target_controller.dart';

class TargetSuccessController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    if (Get.isRegistered<TargetController>()) {
      Get.find<TargetController>().loadTargets();
    }
  }

  void goToTargetPage() {
    Get.offAllNamed(
      AppRoutes.target,
    );
  }
}