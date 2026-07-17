import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/history_controller.dart';
import '../../add_note/controllers/add_note_controller.dart';
import '../../../app/routes/app_routes.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => Column(
          children: [

            // SEARCH
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: TextField(
                onChanged: controller.searchNote,
                decoration: InputDecoration(
                  hintText: "Cari aktivitas...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // FILTER + SORT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [

                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [

                          _buildChip("Semua"),
                          _buildChip("Hari Ini"),
                          _buildChip("Minggu"),
                          _buildChip("Bulan"),

                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  PopupMenuButton<String>(
                    icon: const Icon(Icons.sort),

                    onSelected: controller.changeSort,

                    itemBuilder: (context) => const [

                      PopupMenuItem(
                        value: "Newest",
                        child: Text("Terbaru"),
                      ),

                      PopupMenuItem(
                        value: "Oldest",
                        child: Text("Terlama"),
                      ),

                    ],
                  ),

                ],
              ),
            ),

            const SizedBox(height: 15),

            // LIST
            Expanded(
              child: controller.filteredNotes.isEmpty
                  ? _buildEmptyState(context)
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: controller.filteredNotes.length,
                      itemBuilder: (context, index) {
                        final note = controller.filteredNotes[index];

                        return Dismissible(
                          key: ValueKey(note.id),

                          direction: DismissDirection.endToStart,

                          confirmDismiss: (_) async {
                            return await Get.dialog<bool>(
                              AlertDialog(
                                title: const Text("Hapus Aktivitas"),
                                content: Text(
                                  "Hapus '${note.activity}' ?",
                                ),
                                actions: [

                                  TextButton(
                                    onPressed: () {
                                      Get.back(result: false);
                                    },
                                    child: const Text("Batal"),
                                  ),

                                  FilledButton(
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.red,
                                    ),
                                    onPressed: () {
                                      Get.back(result: true);
                                    },
                                    child: const Text("Hapus"),
                                  ),

                                ],
                              ),
                            );
                          },

                          onDismissed: (_) {
                            controller.deleteNote(note.id);
                          },

                          background: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 24),

                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),

                          child: Card(
                            color: Theme.of(context).cardColor,
                            margin: const EdgeInsets.only(bottom: 15),

                            child: ListTile(
                              onTap: () {
                                final addController =
                                    Get.find<AddNoteController>();

                                addController.loadNote(note);

                                Get.toNamed(AppRoutes.addNote);
                              },

                              contentPadding:
                                  const EdgeInsets.all(16),

                              leading: CircleAvatar(
                                backgroundColor:
                                    Colors.deepPurple.withValues(alpha: .12),
                                child: Text(
                                  note.mood,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),

                              title: Text(
                                note.activity,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface,
                                ),
                              ),

                              subtitle: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [

                                  const SizedBox(height: 6),

                                  Text(
                                    note.note.isEmpty
                                        ? "-"
                                        : note.note,
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [

                                      const Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                      ),

                                      const SizedBox(width: 5),

                                      Text(
                                        "${note.date.day}/${note.date.month}/${note.date.year}",
                                      ),

                                      const SizedBox(width: 15),

                                      const Icon(
                                        Icons.access_time,
                                        size: 14,
                                      ),

                                      const SizedBox(width: 5),

                                      Text(note.time),

                                    ],
                                  ),

                                ],
                              ),

                              trailing: const Icon(
                                Icons.chevron_right,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String title) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ChoiceChip(
          label: Text(title),

          selected:
              controller.selectedFilter.value == title,

          onSelected: (_) {
            controller.changeFilter(title);
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            Icons.history_toggle_off_rounded,
            size: 90,
            color: Theme.of(context).colorScheme.primary,
          ),

          const SizedBox(height: 18),

          Text(
            "Tidak ada aktivitas yang ditemukan",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 8),

          Text(
            "Mulai menulis aktivitas harian Anda ✨",
            style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: .65),
            ),
          ),

        ],
      ),
    );
  }
}