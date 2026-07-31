import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repositories/note_repository.dart';

import '../../../services/notification_service.dart';

import '../../home/controllers/home_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../statistics/controllers/statistics_controller.dart';

class AddNoteController extends GetxController {
  final activityController = TextEditingController();
  final noteController = TextEditingController();

  final NoteRepository repository = NoteRepository();

  final uuid = const Uuid();

  // STATE
  final selectedMood = "😊".obs;
  final selectedPriority = "Medium".obs;
  final selectedCategory = "Belajar".obs;

  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;

  final isEditing = false.obs;

  NoteModel? editingNote;

  // FORMAT
  String get formattedDate =>
      DateFormat('dd MMM yyyy').format(selectedDate.value);

  String get formattedTime =>
      "${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')}";

  // DATE PICKER
  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  // TIME PICKER
  Future<void> pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  // LOAD NOTE
  void loadNote(NoteModel note) {
    editingNote = note;
    isEditing.value = true;
    activityController.text = note.activity;
    noteController.text = note.note;
    selectedMood.value = note.mood;
    selectedPriority.value = note.priority;
    selectedCategory.value = note.category;

    selectedDate.value = note.date;

    try {
      final split = note.time.split(":");

      selectedTime.value = TimeOfDay(
        hour: int.parse(split[0]),
        minute: int.parse(split[1]),
      );
    } catch (_) {
      selectedTime.value = TimeOfDay.now();
    }
  }

  // RESET FORM
  void resetForm() {
    activityController.clear();
    noteController.clear();

    selectedMood.value = "😊";
    selectedPriority.value = "Medium";
    selectedCategory.value = "Belajar";

    selectedDate.value = DateTime.now();
    selectedTime.value = TimeOfDay.now();

    editingNote = null;
    isEditing.value = false;
  }

  // SAVE / UPDATE
  Future<void> saveNote() async {
    try {
      if (activityController.text.trim().isEmpty) {
        Get.snackbar(
          "Peringatan",
          "Nama aktivitas wajib diisi",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final bool editing = isEditing.value;
      final note = NoteModel(
        id: editing
            ? editingNote!.id
            : uuid.v4(),

        activity: activityController.text.trim(),
        note: noteController.text.trim(),
        mood: selectedMood.value,
        priority: selectedPriority.value,
        category: selectedCategory.value,
        date: selectedDate.value,
        time: formattedTime,
      );

      if (editing) {
        await repository.updateNote(note);
      } else {
        await repository.addNote(note);
      }

      await NotificationService.instance.showNotification(
        title: editing
            ? "Aktivitas Diperbarui"
            : "Aktivitas Baru",
        body: note.activity,
      );

      if (Get.isRegistered<HomeController>()) {
        await Get.find<HomeController>().refreshData();
      }

      if (Get.isRegistered<HistoryController>()) {
        await Get.find<HistoryController>().refreshData();
      }

      if (Get.isRegistered<StatisticsController>()) {
        await Get.find<StatisticsController>().refreshData();
      }

      resetForm();

      Get.back();

      Get.snackbar(
        "Berhasil",
        editing
            ? "Aktivitas berhasil diperbarui 🎉"
            : "Aktivitas berhasil disimpan 🎉",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    activityController.dispose();
    noteController.dispose();
    super.onClose();
  }
}