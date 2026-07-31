import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_daily/app/routes/app_routes.dart';

import 'package:my_daily/app/widgets/app_background.dart';
import 'package:my_daily/app/widgets/page_padding.dart';
import 'package:my_daily/app/widgets/section_title.dart';

import 'package:my_daily/modules/home/widgets/home_header.dart';
import 'package:my_daily/modules/home/widgets/progress_card.dart';
import 'package:my_daily/modules/home/widgets/calendar_card.dart';
import 'package:my_daily/modules/target/target_card.dart';

import '../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: PagePadding(
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  HomeHeader(
                    username: controller.username.value,
                    subtitle: controller.greeting.value,
                    photoUrl: controller.photoUrl.value,
                  ),

                  const SizedBox(height: 20),

                  ProgressCard(
                    completed: controller.completedTask.value,
                    total: controller.totalTask.value,
                  ),

                  const SizedBox(height: 20),

                  const CalendarCard(),

                  const SizedBox(height: 20),

                  const TargetCard(),

                  const SizedBox(height: 20),

                  SectionTitle(
                    title: 'Aktivitas Hari Ini',
                    actionText: 'Lihat Semua',
                    onAction: () {
                      Get.toNamed(AppRoutes.history);
                    },
                  ),

                  const SizedBox(height: 12),


                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}