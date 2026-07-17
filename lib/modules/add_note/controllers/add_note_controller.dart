import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repositories/note_repository.dart';

import 'package:my_daily/modules/home/controllers/home_controller.dart';
import 'package:my_daily/modules/history/controllers/history_controller.dart';
import 'package:my_daily/modules/calendar/controllers/calendar_controller.dart';
import 'package:my_daily/modules/statistics/controllers/statistics_controller.dart';

import '../../../services/notification_service.dart';

class AddNoteController extends GetxController {
  final activityController = TextEditingController();
  final noteController = TextEditingController();

  final NoteRepository repository = NoteRepository();

  final uuid = const Uuid();

  // ==========================
  // Observable
  // ==========================

  final selectedMood = "😊".obs;
  final selectedPriority = "Medium".obs;
  final selectedCategory = "Study".obs;

  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;

  final isEditing = false.obs;

  NoteModel? editingNote;

  // ==========================
  // FORMAT
  // ==========================

  String get formattedDate =>
      DateFormat('dd MMM yyyy').format(selectedDate.value);

  String formattedTime(BuildContext context) =>
      selectedTime.value.format(context);

  // ==========================
  // PICK DATE
  // ==========================

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

  // ==========================
  // PICK TIME
  // ==========================

  Future<void> pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (picked != null) {
      selectedTime.value = picked;
    }
  }

  // ==========================
  // LOAD NOTE FOR EDIT
  // ==========================

  void loadNote(NoteModel note) {
    editingNote = note;
    isEditing.value = true;

    activityController.text = note.activity;
    noteController.text = note.note;

    selectedMood.value = note.mood;
    selectedPriority.value = note.priority;
    selectedCategory.value = "Study";

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

  // ==========================
  // RESET FORM
  // ==========================

  void resetForm() {
    activityController.clear();
    noteController.clear();

    selectedMood.value = "😊";
    selectedPriority.value = "Medium";
    selectedCategory.value = "Study";

    selectedDate.value = DateTime.now();
    selectedTime.value = TimeOfDay.now();

    editingNote = null;
    isEditing.value = false;
  }

  // ==========================
  // SAVE / UPDATE NOTE
  // ==========================

  Future<void> saveNote() async {
    try {
      if (activityController.text.trim().isEmpty) {
        Get.snackbar(
          "Warning",
          "Activity cannot be empty!",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final note = NoteModel(
        id: isEditing.value ? editingNote!.id : uuid.v4(),
        activity: activityController.text.trim(),
        note: noteController.text.trim(),
        mood: selectedMood.value,
        priority: selectedPriority.value,
        date: selectedDate.value,
        time: formattedTime(Get.context!),
      );

      // ==========================
      // SAVE / UPDATE
      // ==========================

      if (isEditing.value) {
        await repository.updateNote(note);
      } else {
        await repository.addNote(note);
      }

      // ==========================
      // NOTIFICATION
      // ==========================

      await NotificationService.instance.showNotification(
        title: isEditing.value
            ? "Activity Updated"
            : "New Activity Added",
        body: note.activity,
      );

      // ==========================
      // REFRESH ALL MODULES
      // ==========================

      if (Get.isRegistered<HomeController>()) {
        await Get.find<HomeController>().refreshData();
      }

      if (Get.isRegistered<HistoryController>()) {
        await Get.find<HistoryController>().refreshData();
      }

      if (Get.isRegistered<CalendarController>()) {
        await Get.find<CalendarController>().refreshData();
      }

      if (Get.isRegistered<StatisticsController>()) {
        await Get.find<StatisticsController>().refreshData();
      }

      // ==========================
      // RESET FORM
      // ==========================

      resetForm();

      Get.back();

      Get.snackbar(
        "Success",
        isEditing.value
            ? "Activity updated successfully 🎉"
            : "Activity saved successfully 🎉",
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