import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_daily/app/widgets/app_background.dart';
import '../../../app/widgets/page_padding.dart';

import '../controllers/history_controller.dart';

import '../widgets/history_header.dart';
import '../widgets/history_search_box.dart';
import '../widgets/history_filter_tabs.dart';

import '../widgets/history_activity_card.dart';
import '../widgets/history_target_card.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: PagePadding(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// Header
                const HistoryHeader(),

                const SizedBox(height: 24),

                /// Search
                HistorySearchBox(
                  onChanged: controller.searchNote,
                ),

                const SizedBox(height: 20),

                /// Filter
                HistoryFilterTabs(
                  selected: controller.selectedTab.value,
                  onChanged: controller.changeTab,
                ),

                const SizedBox(height: 24),

                /// List Riwayat
                Expanded(
                  child: controller.filteredNotes.isEmpty
                      ? const Center(
                          child: Text("Belum ada aktivitas"),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredNotes.length,
                          itemBuilder: (context, index) {
                            final note = controller.filteredNotes[index];

                            if (note.activity == "Target") {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: HistoryTargetCard(
                                  title: note.activity,
                                  time: note.time,
                                  onTap:() {
                                  },
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: HistoryActivityCard(
                                emoji: note.mood,
                                title: note.activity,
                                subtitle: note.note,
                                time: note.time,
                                onDelete: () {
                                  Get.defaultDialog(
                                    title: "Hapus Catatan",
                                    middleText:
                                        "Apakah kamu yakin ingin menghapus catatan ini?",
                                    textCancel: "Batal",
                                    textConfirm: "Hapus",
                                    confirmTextColor: Colors.white,
                                    onConfirm: () {
                                      controller.deleteNote(note.id);
                                      Get.back();
                                    },
                                  );
                                }
                              ),
                            );
                          },
                        ),
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}