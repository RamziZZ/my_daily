import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class ActivityNameField extends GetView<AddNoteController> {
  const ActivityNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller.activityController,
          decoration: const InputDecoration(
            hintText: "Nama Aktivitas",
          ),
        ),

        const SizedBox(height: 12),

        TextField(
          controller: controller.noteController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: "Catatan",
          ),
        ),
      ],
    );
  }
}