import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repositories/note_repository.dart';

class CalendarController extends GetxController {
  final repository = NoteRepository();

  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;

  RxList<NoteModel> notes = <NoteModel>[].obs;
  RxList<NoteModel> selectedNotes = <NoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  Future<void> loadNotes() async {
    notes.value = await repository.getNotes();
    filterNotes(selectedDay.value);
  }

  void onDaySelected(DateTime selected, DateTime focused) {
    selectedDay.value = selected;
    focusedDay.value = focused;

    filterNotes(selected);
  }

  void filterNotes(DateTime day) {
    selectedNotes.value = notes.where((note) {
      return isSameDay(note.date, day);
    }).toList();
  }

  List<NoteModel> getEvents(DateTime day) {
    return notes.where((note) {
      return isSameDay(note.date, day);
    }).toList();
  }

  Future<void> refreshData() async {
    await loadNotes();
  }
}