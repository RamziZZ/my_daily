import 'package:flutter/material.dart';

class LoginIllustration extends StatelessWidget {
  const LoginIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/login_illustration.png',
      height: 230,
      fit: BoxFit.contain,
    );
  }
}