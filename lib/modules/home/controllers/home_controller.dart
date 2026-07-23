import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/note_model.dart';
import '../../../data/repositories/note_repository.dart';
import '../../../services/auth_service.dart';

class HomeController extends GetxController {
  final repository = NoteRepository();
  final AuthService authService = Get.find<AuthService>();

  // USER
  final username = "User".obs;
  final photoUrl = "".obs;

  // GREETING
  final greeting = "".obs;

  final currentDate =
      DateFormat("EEEE, dd MMMM yyyy").format(DateTime.now()).obs;

  // NOTES
  RxList<NoteModel> notes = <NoteModel>[].obs;

  final completedTask = 0.obs;
  final totalTask = 0.obs;

  // MOOD
  final currentMood = "Happy".obs;
  final currentMoodEmoji = "😊".obs;

  final weeklyMood = <String>[
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

    loadUser();
    loadNotes();
    setGreeting();
  }

  // LOAD USER FIREBASE
  void loadUser() {
    username.value =
        authService.currentUser?.displayName ?? "User";

    photoUrl.value =
        authService.currentUser?.photoURL ?? "";
  }

  // LOAD NOTES
  Future<void> loadNotes() async {
    notes.value = await repository.getNotes();

    totalTask.value = notes.length;

    // sementara semua dianggap selesai
    completedTask.value = notes.length;

    if (notes.isNotEmpty) {
      currentMoodEmoji.value = notes.last.mood;
      currentMood.value = moodName(notes.last.mood);
    }
  }

  Future<void> refreshData() async {
    loadUser();
    await loadNotes();
  }

  // MOOD NAME
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

  // GREETING
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