import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class ActivityNameField extends GetView<AddNoteController> {
  const ActivityNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.activityController,
      decoration: InputDecoration(
        hintText: "Nama Aktivitas",
        filled: true,
        fillColor: Theme.of(context).cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}