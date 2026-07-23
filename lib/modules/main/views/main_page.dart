import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_daily/modules/add_note/views/add_note_page.dart';


import '../controllers/main_controller.dart';

import '../../home/views/home_page.dart';
import '../../history/views/history_page.dart';
import '../../statistics/views/statistics_page.dart';
import '../../settings/views/settings_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomePage(),
            HistoryPage(),
            AddNotePage(),
            StatisticsPage(),
            SettingsPage(),
          ],
        ),

        floatingActionButton: SizedBox(
          width: 68,
          height: 68,
          child: FloatingActionButton(
            heroTag: "addActivity",
            onPressed: () {
              controller.changeTab(2);
            },
            backgroundColor: const Color(0xffE5E5E5),
            elevation: 8,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              size: 34,
              color: Color(0xff666666),
            ),
          ),
        ),

        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            elevation: 15,
            color: Colors.white,

            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 72,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildItem(
                      Icons.home_rounded,
                      "Beranda",
                      0,
                    ),

                    _buildItem(
                      Icons.history_rounded,
                      "Riwayat",
                      1,
                    ),

                    const SizedBox(width: 40),

                    _buildItem(
                      Icons.bar_chart_rounded,
                      "Statistik",
                      3,
                    ),

                    _buildItem(
                      Icons.settings_rounded,
                      "Pengaturan",
                      4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
    IconData icon,
    String label,
    int index,
  ) {
    final selected = controller.currentIndex.value == index;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => controller.changeTab(index),
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xff6C63FF).withValues(alpha: 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 24,
                color: selected
                    ? const Color(0xff6C63FF)
                    : Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.w400,
                color: selected
                    ? const Color(0xff6C63FF)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}