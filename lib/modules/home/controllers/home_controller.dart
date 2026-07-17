import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:my_daily/data/models/note_model.dart';
import 'package:my_daily/data/repositories/note_repository.dart';

class HomeController extends GetxController {
  final repository = NoteRepository();

  final username = "Ramzi".obs;

  final greeting = "".obs;

  final currentDate =
      DateFormat("EEEE, dd MMMM yyyy").format(DateTime.now()).obs;

  RxList<NoteModel> notes = <NoteModel>[].obs;

  final completedTask = 0.obs;
  final totalTask = 0.obs;

  final currentMood = "Happy".obs;
  final currentMoodEmoji = "😊".obs;

  final weeklyMood = [
    "😊",
    "😄",
    "🙂",
    "😐",
    "😴",
    "😊",
    "😁",
  ].obs;

  @override
  void onInit() {
    super.onInit();

    loadNotes();
    setGreeting();
  }

  Future<void> loadNotes() async {
    notes.value = await repository.getNotes();

    totalTask.value = notes.length;

    completedTask.value = notes.length;

    if (notes.isNotEmpty) {
      currentMoodEmoji.value = notes.last.mood;
      currentMood.value = moodName(notes.last.mood);
    }
  }

  Future<void> refreshData() async {
    await loadNotes();
  }

  String moodName(String emoji) {
    switch (emoji) {
      case "😁":
        return "Excited";

      case "😊":
        return "Happy";

      case "🙂":
        return "Relax";

      case "😐":
        return "Normal";

      case "😔":
        return "Sad";

      case "😡":
        return "Angry";

      default:
        return "Happy";
    }
  }

  void setGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      greeting.value = "Good Morning";
    } else if (hour < 15) {
      greeting.value = "Good Afternoon";
    } else if (hour < 18) {
      greeting.value = "Good Evening";
    } else {
      greeting.value = "Good Night";
    }
  }
}