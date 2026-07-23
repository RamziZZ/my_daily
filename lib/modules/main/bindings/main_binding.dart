import 'package:get/get.dart';

import '../controllers/main_controller.dart';

import '../../home/bindings/home_binding.dart';
import '../../history/bindings/history_binding.dart';
import '../../statistics/bindings/statistics_binding.dart';
import '../../settings/bindings/settings_binding.dart';
import '../../add_note/bindings/add_note_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<MainController>(
      () => MainController(),
    );

    HomeBinding().dependencies();
    HistoryBinding().dependencies();
    AddNoteBinding().dependencies();
    StatisticsBinding().dependencies();
    SettingsBinding().dependencies();
  }
}