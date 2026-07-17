import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

import '../widgets/activity_field.dart';
import '../widgets/category_selector.dart';
import '../widgets/date_time_card.dart';
import '../widgets/mood_selector.dart';
import '../widgets/priority_selector.dart';
import '../widgets/note_field.dart';
import '../widgets/save_button.dart';

class AddNotePage extends GetView<AddNoteController> {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            controller.isEditing.value
                ? "Edit Activity"
                : "Tambah Activity",
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Header
                Text(
                  controller.isEditing.value
                      ? "Perbarui Aktivitasmu ✨"
                      : "Buat Aktivitasmu hari ini ✨",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 25),

                /// Activity
                ActivityField(
                  controller: controller.activityController,
                ),

                const SizedBox(height: 25),

                /// Category
                const Text(
                  "Kategori Aktivitas",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                CategorySelector(
                  selectedCategory: controller.selectedCategory.value,
                  onSelect: (value) {
                    controller.selectedCategory.value = value;
                  },
                ),

                const SizedBox(height: 25),

                /// Date & Time
                DateTimeCard(
                  date: controller.formattedDate,
                  time: controller.formattedTime(context),
                  onDateTap: () {
                    controller.pickDate(context);
                  },
                  onTimeTap: () {
                    controller.pickTime(context);
                  },
                ),

                const SizedBox(height: 25),

                /// Mood
                const Text(
                  "Bagaimana perasaanmu hari ini?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                MoodSelector(
                  selectedMood: controller.selectedMood.value,
                  onSelect: (value) {
                    controller.selectedMood.value = value;
                  },
                ),

                const SizedBox(height: 25),

                /// Priority
                const Text(
                  "Priority",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                PrioritySelector(
                  priority: controller.selectedPriority.value,
                  onSelect: (value) {
                    controller.selectedPriority.value = value;
                  },
                ),

                const SizedBox(height: 25),

                /// Notes
                const Text(
                  "Catatan Aktivitas",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                NoteField(
                  controller: controller.noteController,
                ),

                const SizedBox(height: 35),

                /// Save / Update Button
                SaveButton(
                  text: controller.isEditing.value
                      ? "Ubah Aktivitas"
                      : "Simpan Aktivitas",
                  onTap: controller.saveNote,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}