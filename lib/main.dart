import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:my_daily/app/routes/app_pages.dart';
import 'package:my_daily/app/routes/app_routes.dart';
import 'package:my_daily/app/theme/app_theme.dart';

import 'package:my_daily/data/models/note_model.dart';
import 'package:my_daily/data/repositories/note_repository.dart';

import 'services/notification_service.dart';
import 'services/theme_service.dart';
import 'services/settings_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Hive
  await Hive.initFlutter();

  // Inisialisasi Notification Service
  await NotificationService.instance.init();

  // Register Adapter
  Hive.registerAdapter(NoteModelAdapter());

  // Inisialisasi Theme Service
  await Get.putAsync(() => ThemeService().init());

  // Register Settings Service
  Get.put(SettingsService());

  Get.put(NoteRepository());

  runApp(const MyDailyApp());
}

class MyDailyApp extends StatelessWidget {
  const MyDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyDaily',

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}