import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';
import 'mood_item.dart';

class MoodSelector extends GetView<AddNoteController> {
  const MoodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          "Bagaimana Mood Kamu Hari Ini ?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Obx(
          () => Row(
            children: [
              Expanded(
                child: MoodItem(
                  emoji: "😊",
                  title: "Bahagia",
                  selected:
                      controller.selectedMood.value ==
                      "😊",
                  onTap: () => controller
                      .selectedMood.value = "😊",
                ),
              ),

              Expanded(
                child: MoodItem(
                  emoji: "😐",
                  title: "Biasa",
                  selected:
                      controller.selectedMood.value ==
                      "😐",
                  onTap: () => controller
                      .selectedMood.value = "😐",
                ),
              ),

              Expanded(
                child: MoodItem(
                  emoji: "😭",
                  title: "Sedih",
                  selected:
                      controller.selectedMood.value ==
                      "😭",
                  onTap: () => controller
                      .selectedMood.value = "😭",
                ),
              ),

              Expanded(
                child: MoodItem(
                  emoji: "😡",
                  title: "Marah",
                  selected:
                      controller.selectedMood.value ==
                      "😡",
                  onTap: () => controller
                      .selectedMood.value = "😡",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}