import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';
import 'mood_item.dart';

class MoodSelector extends GetView<AddNoteController> {
  const MoodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final moods = [
      {"emoji": "😊", "title": "Senang"},
      {"emoji": "🙂", "title": "Tenang"},
      {"emoji": "😐", "title": "Biasa"},
      {"emoji": "😔", "title": "Sedih"},
      {"emoji": "😡", "title": "Marah"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            children: moods.map((mood) {
              return Expanded(
                child: MoodItem(
                  emoji: mood["emoji"]!,
                  title: mood["title"]!,
                  selected:
                      controller.selectedMood.value ==
                      mood["emoji"],
                  onTap: () {
                    controller.selectedMood.value =
                        mood["emoji"]!;
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}