import 'package:flutter/material.dart';

class PasswordSuccessText
    extends StatelessWidget {

  const PasswordSuccessText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [

        Text(
          "Kata Sandi Berhasil Diubah!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 12),

        Text(
          "Kata sandi anda telah berhasil diperbarui, silahkan login menggunakan kata sandi baru.",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}