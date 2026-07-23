import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../../app/routes/app_routes.dart';
import 'package:flutter/foundation.dart';

class SplashController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  @override
  void onReady() {
    super.onReady();

    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    debugPrint("===== FIREBASE USER =====");
    debugPrint(authService.currentUser.toString());
    debugPrint(authService.isLoggedIn.toString());

    if (authService.isLoggedIn) {
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}