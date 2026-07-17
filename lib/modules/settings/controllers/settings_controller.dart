import 'package:get/get.dart';

import '../../../services/theme_service.dart';
import '../../../services/settings_service.dart';
import '../../../data/repositories/note_repository.dart';

import '../../home/controllers/home_controller.dart';
import '../../history/controllers/history_controller.dart';
import '../../calendar/controllers/calendar_controller.dart';
import '../../statistics/controllers/statistics_controller.dart';

class SettingsController extends GetxController {
  // Services
  final ThemeService themeService = Get.find<ThemeService>();
  final SettingsService settingsService = Get.find<SettingsService>();

  // Repository
  final NoteRepository repository = Get.find<NoteRepository>();

  // User
  final username = "".obs;

  // Notification
  final notification = true.obs;

  // Theme
  late RxBool isDarkMode;

  @override
  void onInit() {
    super.onInit();

    isDarkMode = themeService.isDark.obs;

    loadSettings();
  }

  // LOAD SETTINGS
  Future<void> loadSettings() async {
    username.value = await settingsService.getUsername();
    notification.value = await settingsService.getNotification();
  }

  // USERNAME
  Future<void> changeUsername(String value) async {
    if (value.trim().isEmpty) return;

    username.value = value.trim();

    await settingsService.saveUsername(value.trim());
  }

  // DARK MODE
  Future<void> toggleDarkMode(bool value) async {
    isDarkMode.value = value;
    await themeService.saveTheme(value);
  }

  // NOTIFICATION
  Future<void> toggleNotification(bool value) async {
    notification.value = value;

    await settingsService.saveNotification(value);
  }

  // REFRESH
  Future<void> refreshData() async {
    await loadSettings();
    update();
  }

  // DELETE ALL DATA
  Future<void> deleteAllData() async {
    await repository.deleteAllNotes();

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

    Get.back();

    Get.snackbar(
      "Success",
      "All activities have been deleted successfully.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}