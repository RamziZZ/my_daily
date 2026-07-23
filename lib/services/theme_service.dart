import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeService extends GetxService {
  static const String boxName = "settings";
  static const String keyDarkMode = "darkMode";

  late Box box;

  Future<ThemeService> init() async {
    box = await Hive.openBox(boxName);

    Get.changeThemeMode(themeMode);

    return this;
  }

  /// Apakah Dark Mode aktif
  bool get isDark =>
      box.get(keyDarkMode, defaultValue: false);

  /// ThemeMode untuk MaterialApp
  ThemeMode get themeMode =>
      isDark ? ThemeMode.dark : ThemeMode.light;

  /// Simpan tema
  Future<void> saveTheme(bool value) async {
    await box.put(keyDarkMode, value);

    Get.changeThemeMode(
      value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}