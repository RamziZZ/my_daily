import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/statistics_controller.dart';
import '../widgets/statistic_card.dart';
import '../widgets/mood_pie_chart.dart';
import '../widgets/summary_card.dart';
import '../widgets/insight_card.dart';

class StatisticsPage extends GetView<StatisticsController> {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Obx(
  () {

    // LOADING
    if (controller.isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // EMPTY STATE
    if (controller.notes.isEmpty) {
      return RefreshIndicator(
        onRefresh: controller.refreshData,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            SizedBox(height: 140),

            Icon(
              Icons.analytics_outlined,
              size: 90,
              color: Colors.grey,
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                "Belum ada aktivitas",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            Center(
              child: Text(
                "Tambahkan aktivitas terlebih dahulu\nagar statistik dapat ditampilkan.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // NORMAL UI
    return RefreshIndicator(
      onRefresh: controller.refreshData,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: SingleChildScrollView(
          key: ValueKey(controller.totalActivity.value),
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // SUMMARY
              Text(
                "Ringkasan Aktivitas",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: "Total",
                      value: controller.totalActivity.value.toString(),
                      icon: Icons.assignment_rounded,
                      color: Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: SummaryCard(
                      title: "Hari Ini",
                      value: controller.todayActivity.value.toString(),
                      icon: Icons.today_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: "Minggu",
                      value: controller.weekActivity.value.toString(),
                      icon: Icons.calendar_view_week_rounded,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: SummaryCard(
                      title: "Bulan",
                      value: controller.monthActivity.value.toString(),
                      icon: Icons.calendar_month_rounded,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // MOOD
              Text(
                "Mood Overview",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              StatisticCard(
                title: "Happy Mood",
                value: controller.happy.value.toString(),
                icon: Icons.emoji_emotions,
                color: Colors.orange,
              ),

              const SizedBox(height: 16),

              StatisticCard(
                title: "Relax Mood",
                value: controller.relax.value.toString(),
                icon: Icons.self_improvement,
                color: Colors.green,
              ),

              const SizedBox(height: 16),

              StatisticCard(
                title: "Normal Mood",
                value: controller.normal.value.toString(),
                icon: Icons.sentiment_neutral,
                color: Colors.blue,
              ),

              const SizedBox(height: 16),

              StatisticCard(
                title: "Sad Mood",
                value: controller.sad.value.toString(),
                icon: Icons.sentiment_dissatisfied,
                color: Colors.grey,
              ),

              const SizedBox(height: 16),

              StatisticCard(
                title: "Angry Mood",
                value: controller.angry.value.toString(),
                icon: Icons.sentiment_very_dissatisfied,
                color: Colors.red,
              ),

              const SizedBox(height: 28),

              MoodPieChart(
                happy: controller.happy.value,
                relax: controller.relax.value,
                normal: controller.normal.value,
                sad: controller.sad.value,
                angry: controller.angry.value,
              ),

              const SizedBox(height: 30),

              // PRIORITY
              Text(
                "Priority Summary",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: StatisticCard(
                      title: "Low",
                      value: controller.low.value.toString(),
                      icon: Icons.flag_outlined,
                      color: Colors.green,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: StatisticCard(
                      title: "Medium",
                      value: controller.medium.value.toString(),
                      icon: Icons.flag,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: StatisticCard(
                      title: "High",
                      value: controller.high.value.toString(),
                      icon: Icons.outlined_flag,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // INSIGHT
              Text(
                "Insights",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              InsightCard(
                title: "Most Frequent Mood",
                value: controller.mostMood.value,
                icon: Icons.emoji_events_rounded,
                color: Colors.amber,
              ),

              const SizedBox(height: 12),

              InsightCard(
                title: "Highest Priority",
                value: controller.mostPriority.value,
                icon: Icons.flag_circle_rounded,
                color: Colors.red,
              ),

              const SizedBox(height: 12),

              InsightCard(
                title: "Productivity Score",
                value: "${controller.productivity.value}%",
                icon: Icons.local_fire_department_rounded,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  },
),
    );
  }
}