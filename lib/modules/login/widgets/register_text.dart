import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Belum memiliki akun? "),

        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.register);
          },
          child: const Text(
            "Daftar sekarang",
            style: TextStyle(
              color: Color(0xff7B4DFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}