import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/add_note_controller.dart';

class ActivityDatePicker extends GetView<AddNoteController> {
  const ActivityDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () => controller.pickDate(context),
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
              const Icon(Icons.calendar_today),

              const SizedBox(width: 10),

              Text(
                DateFormat(
                  'dd/MM/yyyy',
                ).format(
                  controller.selectedDate.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}