import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../services/auth_service.dart';
import '../../../app/routes/app_routes.dart';

class RegisterController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // ==========================
  // SHOW / HIDE PASSWORD
  // ==========================

  void togglePassword() => obscurePassword.toggle();

  void toggleConfirmPassword() => obscureConfirmPassword.toggle();

  // ==========================
  // REGISTER
  // ==========================

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    FocusManager.instance.primaryFocus?.unfocus();

    try {
      isLoading.value = true;

      await authService.register(
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Get.snackbar(
        "Berhasil",
        "Akun berhasil dibuat.",
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Register Gagal",
        _firebaseError(e.code),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (_) {
      Get.snackbar(
        "Error",
        "Terjadi kesalahan yang tidak diketahui.",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ==========================
  // FIREBASE ERROR
  // ==========================

  String _firebaseError(String code) {
    switch (code) {
      case "email-already-in-use":
        return "Email sudah digunakan.";

      case "invalid-email":
        return "Format email tidak valid.";

      case "weak-password":
        return "Password terlalu lemah.";

      case "network-request-failed":
        return "Tidak ada koneksi internet.";

      default:
        return "Terjadi kesalahan.";
    }
  }

  // ==========================
  // VALIDATOR
  // ==========================

  String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Username wajib diisi";
    }

    if (value.trim().length < 3) {
      return "Username minimal 3 karakter";
    }

    return null;
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password wajib diisi";
    }

    if (value.length < 6) {
      return "Password minimal 6 karakter";
    }

    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Konfirmasi password wajib diisi";
    }

    if (value != passwordController.text) {
      return "Konfirmasi password tidak sama";
    }

    return null;
  }
}