import 'package:get/get.dart';

import 'package:my_daily/data/models/note_model.dart';
import 'package:my_daily/data/repositories/note_repository.dart';

import 'package:my_daily/modules/home/controllers/home_controller.dart';
import 'package:my_daily/modules/statistics/controllers/statistics_controller.dart';

class HistoryController extends GetxController {
  final repository = NoteRepository();

  final RxList<NoteModel> notes = <NoteModel>[].obs;
  final RxList<NoteModel> filteredNotes = <NoteModel>[].obs;

  final search = "".obs;

  /// Filter
  final selectedFilter = "All".obs;

  /// Sort
  final selectedSort = "Newest".obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  // Load notes from repository
  Future<void> loadNotes() async {
    notes.value = await repository.getNotes();
    applyFilter();
  }

  // Refresh data
  Future<void> refreshData() async {
    await loadNotes();
  }

  // SEARCH
  void searchNote(String keyword) {
    search.value = keyword;
    applyFilter();
  }

  // FILTER
  void changeFilter(String value) {
    selectedFilter.value = value;
    applyFilter();
  }

  // SORT
  void changeSort(String value) {
    selectedSort.value = value;
    applyFilter();
  }

  // APPLY SEARCH + FILTER + SORT
  void applyFilter() {
    List<NoteModel> result = List.from(notes);

    // SEARCH
    if (search.value.isNotEmpty) {
      result = result.where((note) {
        return note.activity
                .toLowerCase()
                .contains(search.value.toLowerCase()) ||
            note.note
                .toLowerCase()
                .contains(search.value.toLowerCase());
      }).toList();
    }

    // FILTER
    final now = DateTime.now();
    switch (selectedFilter.value) {
      case "Today":
        result = result.where((note) {
          return note.date.year == now.year &&
              note.date.month == now.month &&
              note.date.day == now.day;
        }).toList();
        break;

      case "Week":
        final firstDay =
            now.subtract(Duration(days: now.weekday - 1));

        final lastDay =
            firstDay.add(const Duration(days: 6));

        result = result.where((note) {
          return note.date.isAfter(
                  firstDay.subtract(const Duration(days: 1))) &&
              note.date.isBefore(
                  lastDay.add(const Duration(days: 1)));
        }).toList();
        break;

      case "Month":
        result = result.where((note) {
          return note.date.month == now.month &&
              note.date.year == now.year;
        }).toList();
        break;

      case "All":
      default:
        break;
    }

    // SORT
    switch (selectedSort.value) {
      case "Newest":
        result.sort((a, b) => b.date.compareTo(a.date));
        break;

      case "Oldest":
        result.sort((a, b) => a.date.compareTo(b.date));
        break;
    }

    filteredNotes.assignAll(result);
  }

  // DELETE NOTE
  Future<void> deleteNote(String id) async {
    await repository.deleteNoteById(id);

    await loadNotes();

    if (Get.isRegistered<HomeController>()) {
      await Get.find<HomeController>().refreshData();
    }

    if (Get.isRegistered<StatisticsController>()) {
      await Get.find<StatisticsController>().refreshData();
    }

    Get.snackbar(
      "Deleted",
      "Activity deleted successfully",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}