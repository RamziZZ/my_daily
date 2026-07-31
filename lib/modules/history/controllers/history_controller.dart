import 'package:get/get.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repositories/note_repository.dart';

import '../../home/controllers/home_controller.dart';
import '../../statistics/controllers/statistics_controller.dart';

class HistoryController extends GetxController {
  final NoteRepository repository = NoteRepository();

  final notes = <NoteModel>[].obs;
  final filteredNotes = <NoteModel>[].obs;

  final search = "".obs;

  /// Semua | Target | Aktivitas
  final selectedTab = "Semua".obs;

  /// Newest | Oldest
  final selectedSort = "Newest".obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  // LOAD DATA HIVE
  Future<void> loadNotes() async {
    notes.value = await repository.getNotes();
    applyFilter();
  }

  Future<void> refreshData() async {
    await loadNotes();
  }

  // SEARCH
  void searchNote(String keyword) {
    search.value = keyword;
    applyFilter();
  }

  // TAB
  void changeTab(String value) {
    selectedTab.value = value;
    applyFilter();
  }

  // SORT
  void changeSort(String value) {
    selectedSort.value = value;
    applyFilter();
  }

  // FILTER DATA
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

    // FILTER TAB
    switch (selectedTab.value) {
      case "Target":
        result = result.where((note) {
          return note.category == "Target";
        }).toList();
        break;

      case "Aktivitas":
        result = result.where((note) {
          return note.category != "Target";
        }).toList();
        break;

      case "Semua":
      default:
        break;
    }

    // SORT
    switch (selectedSort.value) {
      case "Newest":
        result.sort(
          (a, b) => b.date.compareTo(a.date),
        );
        break;

      case "Oldest":
        result.sort(
          (a, b) => a.date.compareTo(b.date),
        );
        break;
    }

    filteredNotes.assignAll(result);
  }

  // DELETE
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
      "Berhasil",
      "Aktivitas berhasil dihapus",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}