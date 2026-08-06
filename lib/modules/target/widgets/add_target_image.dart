import 'package:flutter/material.dart';

class AddTargetImage extends StatelessWidget {
  const AddTargetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'lib/assets/images/target_preview.png',
        height: 170,
      ),
    );
  }
}