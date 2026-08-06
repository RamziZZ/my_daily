import 'package:flutter/material.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [

          Text(
            "Selamat Bergabung!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Buat akun dan mulai catat aktivitas serta\nmood harianmu dengan mudah.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}