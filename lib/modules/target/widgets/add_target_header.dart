import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTargetHeader extends StatelessWidget {
  const AddTargetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),

        const Expanded(
          child: Center(
            child: Text(
              "Tambah Target",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff6C63FF),
              ),
            ),
          ),
        ),

        const SizedBox(width: 48),
      ],
    );
  }
}