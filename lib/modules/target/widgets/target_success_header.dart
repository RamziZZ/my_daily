import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TargetSuccessHeader extends StatelessWidget {
  const TargetSuccessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: Get.back,
        icon: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
        ),
      ),
    );
  }
}