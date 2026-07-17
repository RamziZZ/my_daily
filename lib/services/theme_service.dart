import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class ThemeService extends GetxService {
  static const String boxName = "settings";
  static const String keyDarkMode = "darkMode";

  late Box box;

  Future<ThemeService> init() async {
    box = await Hive.openBox(boxName);

    final isDark = box.get(keyDarkMode, defaultValue: false);

    Get.changeThemeMode(
      isDark ? ThemeMode.dark : ThemeMode.light,
    );

    return this;
  }

  bool get isDark =>
      box.get(keyDarkMode, defaultValue: false);

  Future<void> saveTheme(bool value) async {
    await box.put(keyDarkMode, value);

    Get.changeThemeMode(
      value ? ThemeMode.dark : ThemeMode.light,
    );
  }
}