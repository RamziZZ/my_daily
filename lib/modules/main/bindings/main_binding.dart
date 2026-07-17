import 'package:get/get.dart';

import '../controllers/main_controller.dart';

import '../../home/bindings/home_binding.dart';
import '../../history/bindings/history_binding.dart';
import '../../calendar/bindings/calendar_binding.dart';
import '../../statistics/bindings/statistics_binding.dart';
import '../../settings/bindings/settings_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<MainController>(
      () => MainController(),
    );

    HomeBinding().dependencies();
    HistoryBinding().dependencies();
    CalendarBinding().dependencies();
    StatisticsBinding().dependencies();
    SettingsBinding().dependencies();
  }
}