import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class ActivityTimePicker extends GetView<AddNoteController> {
  const ActivityTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => controller.pickTime(context),
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.access_time),

              const SizedBox(width: 10),

              Text(
                controller.selectedTime.value.format(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}