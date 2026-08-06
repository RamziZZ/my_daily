import 'package:flutter/material.dart';

class PasswordSuccessIcon
    extends StatelessWidget {

  const PasswordSuccessIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/check_preview.png',
      width: 180,
    );
  }
}