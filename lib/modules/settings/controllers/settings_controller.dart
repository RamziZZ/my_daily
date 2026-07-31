import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final username = "User".obs;
  final email = "".obs;

  final notification = true.obs;
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    isDarkMode.value = themeService.isDark;

    loadUser();
    loadSettings();
  }

  // LOAD FIREBASE USER
  void loadUser() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      username.value =
          user.displayName ??
          user.email?.split("@").first ??
          "User";

      email.value = user.email ?? "";
    }
  }

  // LOAD SETTINGS
  Future<void> loadSettings() async {
    notification.value =
        await settingsService.getNotification();
  }

  // CHANGE USERNAME
  Future<void> changeUsername(
    String value,
  ) async {
    if (value.trim().isEmpty) return;

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updateDisplayName(
          value.trim(),
        );

        await user.reload();

        loadUser();
      }

      await settingsService.saveUsername(
        value.trim(),
      );

      Get.snackbar(
        "Berhasil",
        "Username berhasil diperbarui",
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

  // DARK MODE
  Future<void> toggleDarkMode(
    bool value,
  ) async {
    isDarkMode.value = value;

    await themeService.saveTheme(value);
  }

  // NOTIFICATION
  Future<void> toggleNotification(
    bool value,
  ) async {
    notification.value = value;

    await settingsService.saveNotification(
      value,
    );
  }

  // REFRESH
  Future<void> refreshData() async {
    loadUser();
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
    Get.snackbar(
      "Berhasil",
      "Semua aktivitas berhasil dihapus",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      await authService.logout();

      Get.back();

      Get.offAllNamed(
        AppRoutes.login,
      );

      Get.snackbar(
        "Success",
        "Logout berhasil",
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