import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../app/routes/app_routes.dart';
import '../../../services/auth_service.dart';

class LoginController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  //==========================================================
  // CONTROLLER
  //==========================================================

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  //==========================================================
  // STATE
  //==========================================================

  final isLoading = false.obs;
  final obscurePassword = true.obs;

  //==========================================================
  // DISPOSE
  //==========================================================

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //==========================================================
  // SHOW / HIDE PASSWORD
  //==========================================================

  void togglePassword() {
    obscurePassword.toggle();
  }

  //==========================================================
  // LOGIN
  //==========================================================

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      await authService.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      debugPrint(
        "Firebase Login Success : ${authService.currentUser?.email}",
      );

      if (authService.currentUser == null) {
        Get.snackbar(
          "Login Gagal",
          "Firebase tidak mengembalikan data user.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      Get.offAllNamed(AppRoutes.main);

      Get.snackbar(
        "Success",
        "Login berhasil.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case "user-not-found":
          message = "Email belum terdaftar.";
          break;

        case "wrong-password":
          message = "Password salah.";
          break;

        case "invalid-email":
          message = "Format email tidak valid.";
          break;

        case "invalid-credential":
          message = "Email atau password salah.";
          break;

        case "too-many-requests":
          message = "Terlalu banyak percobaan login.";
          break;

        case "network-request-failed":
          message = "Tidak ada koneksi internet.";
          break;

        default:
          message = e.message ?? "Terjadi kesalahan.";
      }

      Get.snackbar(
        "Login Gagal",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  //==========================================================
  // FORGOT PASSWORD
  //==========================================================

  Future<void> forgotPassword() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar(
        "Email diperlukan",
        "Masukkan email terlebih dahulu.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        "Email tidak valid",
        "Masukkan format email yang benar.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      await authService.resetPassword(email);

      Get.snackbar(
        "Berhasil",
        "Link reset password telah dikirim ke email.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case "user-not-found":
          message = "Email belum terdaftar.";
          break;

        case "invalid-email":
          message = "Format email tidak valid.";
          break;

        default:
          message = e.message ?? "Terjadi kesalahan.";
      }

      Get.snackbar(
        "Reset Password",
        message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //==========================================================
  // VALIDATOR
  //==========================================================

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email wajib diisi";
    }

    if (!GetUtils.isEmail(value.trim())) {
      return "Format email tidak valid";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password wajib diisi";
    }

    if (value.length < 6) {
      return "Password minimal 6 karakter";
    }

    return null;
  }
}