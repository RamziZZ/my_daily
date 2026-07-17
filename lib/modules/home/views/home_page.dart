import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_daily/app/routes/app_routes.dart';

import '../controllers/home_controller.dart';

import '../widgets/greeting_card.dart';
import '../widgets/mood_card.dart';
import '../widgets/today_activity_card.dart';
import '../widgets/quick_menu_card.dart';
import '../widgets/weekly_mood_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/mini_calendar_card.dart';
import '../widgets/statistics_preview_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff6C63FF),
        onPressed: () {
          Get.toNamed(AppRoutes.addNote);
        },
        icon: const Icon(Icons.add),
        label: const Text("Tambah Aktivitas"),
      ),

      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreetingCard(
                  greeting: controller.greeting.value,
                  username: controller.username.value,
                  date: controller.currentDate.value,
                ),

                const SizedBox(height: 20),

                const MiniCalendarCard(),

                const SizedBox(height: 20),

                ProgressCard(
                  completed: controller.completedTask.value,
                  total: controller.totalTask.value,
                ),

                const SizedBox(height: 20),

                MoodCard(
                  mood: controller.currentMood.value,
                  emoji: controller.currentMoodEmoji.value,
                ),

                const SizedBox(height: 30),

                /// Today's Activity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Aktivitas Hari Ini",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.history);
                      },
                      child: const Text("Lihat Semua"),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                if (controller.notes.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.inbox_rounded,
                          size: 55,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Belum ada Aktivitas hari ini",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Tekan tombol + untuk menambahkan aktivitas baru",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.notes.length,
                    itemBuilder: (context, index) {
                      final item = controller.notes[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: TodayActivityCard(
                          emoji: item.mood,
                          title: item.activity,
                          time: item.time,
                        ),
                      );
                    },
                  ),

                const SizedBox(height: 30),

                const Text(
                  "Menu Cepat",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.25,
                  children: [
                    QuickMenuCard(
                      icon: Icons.calendar_month_rounded,
                      title: "Kalender",
                      subtitle: "Lihat jadwal Anda",
                      color: Colors.blue,
                      onTap: () {
                        Get.toNamed(AppRoutes.calendar);
                      },
                    ),
                    QuickMenuCard(
                      icon: Icons.bar_chart_rounded,
                      title: "Statistik",
                      subtitle: "Lihat statistik Anda",
                      color: Colors.orange,
                      onTap: () {
                        Get.toNamed(AppRoutes.statistics);
                      },
                    ),
                    QuickMenuCard(
                      icon: Icons.history_rounded,
                      title: "History",
                      subtitle: "Lihat riwayat aktivitas Anda",
                      color: Colors.green,
                      onTap: () {
                        Get.toNamed(AppRoutes.history);
                      },
                    ),
                    QuickMenuCard(
                      icon: Icons.settings_rounded,
                      title: "Settings",
                      subtitle: "Kelola preferensi Anda",
                      color: Colors.deepPurple,
                      onTap: () {
                        Get.toNamed(AppRoutes.settings);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const StatisticsPreviewCard(),

                const SizedBox(height: 30),

                WeeklyMoodCard(
                  moods: controller.weeklyMood,
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}