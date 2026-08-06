import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../main/controllers/main_controller.dart';

class TargetHeader extends StatelessWidget {
  const TargetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {

            // pindah ke Home
            Get.offAllNamed(
              AppRoutes.main,
            );

            // pilih tab Home
            Get.find<MainController>()
                .changeTab(0);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),

        const Expanded(
          child: Center(
            child: Text(
              "Target",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff6C63FF),
              ),
            ),
          ),
        ),

        const SizedBox(width: 40),
      ],
    );
  }
}