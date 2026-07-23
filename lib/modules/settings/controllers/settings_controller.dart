import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

import '../../../services/auth_service.dart';
import '../../../services/settings_service.dart';
import '../../../services/theme_service.dart';
import '../../../data/repositories/note_repository.dart';
import '../../history/controllers/history_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../statistics/controllers/statistics_controller.dart';

class SettingsController extends GetxController {

  // SERVICES
  final ThemeService themeService = Get.find<ThemeService>();
  final SettingsService settingsService = Get.find<SettingsService>();
  final AuthService authService = Get.find<AuthService>();

  // REPOSITORY
  final NoteRepository repository = Get.find<NoteRepository>();

  // STATE
  final username = "".obs;
  final notification = true.obs;
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    isDarkMode.value = themeService.isDark;

    loadSettings();
  }

  // LOAD SETTING
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


    if (Get.isRegistered<StatisticsController>()) {
      await Get.find<StatisticsController>().refreshData();
    }

    Get.back();

    await refreshData();

    Get.snackbar(
      "Success",
      "All activities have been deleted successfully.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      await authService.logout();

      Get.back();

      Get.offAllNamed(AppRoutes.login);

      Get.snackbar(
        "Success",
        "Logout berhasil.",
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
}