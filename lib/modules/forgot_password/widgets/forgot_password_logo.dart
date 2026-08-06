import 'package:flutter/material.dart';

class ForgotPasswordLogo
    extends StatelessWidget {

  const ForgotPasswordLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Image.asset(
          'lib/assets/images/key.png',
          width: 120,
        ),

        const SizedBox(height: 20),

        const Text(
          "MyDaily",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Masukkan email yang telah terdaftar untuk mengubah kata sandi",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}