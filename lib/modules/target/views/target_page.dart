import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';
import '../../../app/routes/app_routes.dart';

import '../controllers/target_controller.dart';

import '../widgets/target_header.dart';
import '../widgets/target_quote_card.dart';
import '../widgets/target_stat_card.dart';
import '../widgets/target_item_card.dart';
import '../widgets/target_add_button.dart';

class TargetPage extends GetView<TargetController> {
  const TargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: PagePadding(
            child: Obx(
              () => Column(
                children: [
                  const TargetHeader(),

                  const SizedBox(height: 20),

                  const TargetQuoteCard(),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: TargetStatCard(
                          value: controller.total.toString(),
                          title: "Total Target",
                          color: Colors.purple,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: TargetStatCard(
                          value: controller.completed.toString(),
                          title: "Selesai",
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: TargetStatCard(
                          value: controller.pending.toString(),
                          title: "Belum",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: controller.targets.isEmpty
                        ? const Center(
                            child: Text(
                              "Belum ada target",
                            ),
                          )
                        : ListView.builder(
                            itemCount:
                                controller.targets.length,
                            itemBuilder:
                                (context, index) {
                              final target =
                                  controller.targets[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.only(
                                  bottom: 12,
                                ),
                                child: TargetItemCard(
                                  target: target,

                                  onToggle: () {
                                    controller
                                        .toggleTarget(
                                      target,
                                    );
                                  },

                                  onDelete: () {
                                    controller
                                        .deleteTarget(
                                      target.id,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                  ),

                  const SizedBox(height: 12),

                  TargetAddButton(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.addTarget,
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}