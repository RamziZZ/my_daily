import 'package:flutter/material.dart';

class TargetSuccessImage extends StatelessWidget {
  const TargetSuccessImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "lib/assets/images/check_preview.png",
        width: 180,
      ),
    );
  }
}