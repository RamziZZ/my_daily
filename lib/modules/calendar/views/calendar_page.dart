import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/calendar_controller.dart';
import '../../add_note/controllers/add_note_controller.dart';
import '../../../app/routes/app_routes.dart';

class CalendarPage extends GetView<CalendarController> {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => Column(
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              color: Theme.of(context).cardColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: TableCalendar(
                  firstDay: DateTime(2024),
                  lastDay: DateTime(2035),
                  focusedDay: controller.focusedDay.value,

                  selectedDayPredicate: (day) =>
                      isSameDay(controller.selectedDay.value, day),

                  onDaySelected: controller.onDaySelected,

                  eventLoader: controller.getEvents,

                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),
                  ),

                  calendarStyle: CalendarStyle(
                    todayDecoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),

                    selectedDecoration: const BoxDecoration(
                      color: Color(0xff6C63FF),
                      shape: BoxShape.circle,
                    ),

                    markerDecoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),

                    defaultTextStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),

                    weekendTextStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),

                    outsideTextStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: .35),
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Activitas",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: controller.selectedNotes.isEmpty
                  ? const Center(
                      child: Text(
                        "Tidak ada aktivitas pada hari ini",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: controller.selectedNotes.length,
                      itemBuilder: (context, index) {
                        final note = controller.selectedNotes[index];

                        return Card(
                          color: Theme.of(context).cardColor,
                          margin: const EdgeInsets.only(bottom: 15),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(18),
                          ),
                          child: ListTile(
                            onTap: () {
                              final addController =
                                  Get.find<AddNoteController>();

                              addController.loadNote(note);

                              Get.toNamed(AppRoutes.addNote);
                            },

                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor:
                                  Colors.deepPurple.shade100,
                              child: Text(
                                note.mood,
                                style: const TextStyle(
                                  fontSize: 22,
                                ),
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

                            subtitle: Text(
                              note.note.isEmpty
                                  ? "-"
                                  : note.note,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withValues(alpha: .7),
                              ),
                            ),

                            trailing: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: 18,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  note.time,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: .7),
                                  ),
                                ),
                              ],
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
}