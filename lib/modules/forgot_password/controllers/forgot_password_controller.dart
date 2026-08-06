import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final isLoading = false.obs;

  Future<void> sendResetEmail() async {

    if (!formKey.currentState!.validate()) {
      return;
    }

    try {

      isLoading.value = true;

      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      Get.toNamed(
        AppRoutes.passwordSuccess,
      );

    } on FirebaseAuthException catch (e) {

      String message = "Terjadi kesalahan";

      switch (e.code) {

        case "user-not-found":
          message = "Email tidak ditemukan";
          break;

        case "invalid-email":
          message = "Format email tidak valid";
          break;

        case "network-request-failed":
          message = "Tidak ada koneksi internet";
          break;
      }

      Get.snackbar(
        "Reset Password",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );

    } finally {

      isLoading.value = false;
    }
  }

  String? validateEmail(String? value) {

    if (value == null || value.trim().isEmpty) {
      return "Email wajib diisi";
    }

    if (!GetUtils.isEmail(value.trim())) {
      return "Format email tidak valid";
    }

    return null;
  }

  @override
  void onClose() {

    emailController.dispose();

    super.onClose();
  }
}