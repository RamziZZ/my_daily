import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsProfileCard extends GetView<SettingsController> {
  const SettingsProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: const Color(0xff6C63FF),
              child: Text(
                controller.username.value
                    .substring(0, 1)
                    .toUpperCase(),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              controller.username.value,
            ),

            Text(
              controller.email.value,
            ),
          ],
        ),
      ),
    );
  }
}