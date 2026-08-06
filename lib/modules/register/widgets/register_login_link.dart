import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class RegisterLoginLink extends StatelessWidget {
  const RegisterLoginLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Get.offNamed(
            AppRoutes.login,
          );
        },
        child: const Text(
          "Sudah punya akun? Login",
        ),
      ),
    );
  }
}