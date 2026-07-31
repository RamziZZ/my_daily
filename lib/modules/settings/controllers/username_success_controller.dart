import 'package:get/get.dart';

class UsernameSuccessController
    extends GetxController {

  final username = "".obs;

  @override
  void onInit() {
    super.onInit();

    username.value =
        Get.arguments ?? "";
  }
}