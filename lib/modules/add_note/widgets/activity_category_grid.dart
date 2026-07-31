import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';
import 'activity_category_item.dart';

class ActivityCategoryGrid extends GetView<AddNoteController> {
  const ActivityCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          ActivityCategoryItem(
            emoji: "📖",
            title: "Belajar",
            selected:
                controller.selectedCategory.value ==
                "Belajar",
            onTap: () {
              controller.selectedCategory.value =
                  "Belajar";
            },
          ),

          ActivityCategoryItem(
            emoji: "💻",
            title: "Meeting",
            selected:
                controller.selectedCategory.value ==
                "Meeting",
            onTap: () {
              controller.selectedCategory.value =
                  "Meeting";
            },
          ),

          ActivityCategoryItem(
            emoji: "🏃",
            title: "Olahraga",
            selected:
                controller.selectedCategory.value ==
                "Olahraga",
            onTap: () {
              controller.selectedCategory.value =
                  "Olahraga";
            },
          ),

          ActivityCategoryItem(
            emoji: "•••",
            title: "Lainnya",
            selected:
                controller.selectedCategory.value ==
                "Lainnya",
            onTap: () {
              controller.selectedCategory.value =
                  "Lainnya";
            },
          ),
        ],
      ),
    );
  }
}