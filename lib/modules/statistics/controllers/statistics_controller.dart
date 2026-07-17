import 'package:get/get.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repositories/note_repository.dart';

class StatisticsController extends GetxController {
  final NoteRepository repository = NoteRepository();

  // Loading
  final isLoading = true.obs;

  // Data
  final RxList<NoteModel> notes = <NoteModel>[].obs;

  // Mood
  final happy = 0.obs;
  final relax = 0.obs;
  final normal = 0.obs;
  final sad = 0.obs;
  final angry = 0.obs;

  // Priority
  final low = 0.obs;
  final medium = 0.obs;
  final high = 0.obs;

  // Summary
  final totalActivity = 0.obs;
  final todayActivity = 0.obs;
  final weekActivity = 0.obs;
  final monthActivity = 0.obs;

  // Insight
  final mostMood = "".obs;
  final mostPriority = "".obs;

  // Productivity
  final productivity = 0.obs;

  @override
  void onInit() {
    super.onInit();
    refreshData();
  }

  Future<void> refreshData() async {
    isLoading.value = true;

    notes.value = await repository.getNotes();

    calculateStatistic();

    isLoading.value = false;
  }

  void calculateStatistic() {
    // Reset
    totalActivity.value = notes.length;

    happy.value = 0;
    relax.value = 0;
    normal.value = 0;
    sad.value = 0;
    angry.value = 0;

    low.value = 0;
    medium.value = 0;
    high.value = 0;

    // Mood & Priority
    for (final note in notes) {
      switch (note.mood) {
        case "😊":
          happy.value++;
          break;

        case "😌":
          relax.value++;
          break;

        case "😐":
          normal.value++;
          break;

        case "😢":
          sad.value++;
          break;

        case "😡":
          angry.value++;
          break;
      }

      switch (note.priority) {
        case "Low":
          low.value++;
          break;

        case "Medium":
          medium.value++;
          break;

        case "High":
          high.value++;
          break;
      }
    }

    // Today
    final now = DateTime.now();

    todayActivity.value = notes.where((note) {
      return note.date.year == now.year &&
          note.date.month == now.month &&
          note.date.day == now.day;
    }).length;

    // Week
    final firstDayWeek =
        now.subtract(Duration(days: now.weekday - 1));

    final lastDayWeek =
        firstDayWeek.add(const Duration(days: 6));

    weekActivity.value = notes.where((note) {
      return note.date.isAfter(
              firstDayWeek.subtract(const Duration(days: 1))) &&
          note.date.isBefore(
              lastDayWeek.add(const Duration(days: 1)));
    }).length;

    // Month
    monthActivity.value = notes.where((note) {
      return note.date.year == now.year &&
          note.date.month == now.month;
    }).length;

    // Most Mood
    final moodMap = {
      "😊 Happy": happy.value,
      "😌 Relax": relax.value,
      "😐 Normal": normal.value,
      "😢 Sad": sad.value,
      "😡 Angry": angry.value,
    };

    mostMood.value = moodMap.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;

    // Most Priority
    final priorityMap = {
      "Low": low.value,
      "Medium": medium.value,
      "High": high.value,
    };

    mostPriority.value = priorityMap.entries
        .reduce((a, b) => a.value >= b.value ? a : b)
        .key;

    // Productivity (Target 25 aktivitas)
    productivity.value =
        ((totalActivity.value / 25) * 100)
            .clamp(0, 100)
            .toInt();
  }
}