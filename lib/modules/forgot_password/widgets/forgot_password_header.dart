import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        const Text(
          "Lupa Kata Sandi",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xff7B4DFF),
          ),
        ),
      ],
    );
  }
}