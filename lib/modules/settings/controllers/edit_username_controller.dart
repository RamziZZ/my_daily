import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_controller.dart';
import '../../../app/routes/app_routes.dart';

class EditUsernameController extends GetxController {
  final SettingsController settingsController =
      Get.find<SettingsController>();

  final usernameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    usernameController.text =
        settingsController.username.value;
  }

  Future<void> saveUsername() async {
    final username =
        usernameController.text.trim();

    if (username.isEmpty) {
      Get.snackbar(
        "Warning",
        "Username tidak boleh kosong",
      );
      return;
    }

    await settingsController.changeUsername(
      username,
    );

    Get.offNamed(
      AppRoutes.usernameSuccess,
      arguments: username,
    );
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }
}