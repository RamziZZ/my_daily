import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

import '../../home/views/home_page.dart';
import '../../history/views/history_page.dart';
import '../../calendar/views/calendar_page.dart';
import '../../statistics/views/statistics_page.dart';
import '../../settings/views/settings_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [

            HomePage(),
            HistoryPage(),
            CalendarPage(),
            StatisticsPage(),
            SettingsPage(),
          ],
        ),

        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: controller.changeTab,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),

            NavigationDestination(
              icon: Icon(Icons.history),
              label: "History",
            ),

            NavigationDestination(
              icon: Icon(Icons.calendar_month),
              label: "Calendar",
            ),

            NavigationDestination(
              icon: Icon(Icons.bar_chart),
              label: "Stats",
            ),

            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),

          ],

        ),

      ),

    );

  }

}