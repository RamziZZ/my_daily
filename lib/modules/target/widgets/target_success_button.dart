import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class TargetSuccessButton extends StatelessWidget {
  const TargetSuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Get.offAllNamed(
            AppRoutes.target,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xffE5E5E5,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          "Lihat Target",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}