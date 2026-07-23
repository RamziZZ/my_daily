import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  color: Color(0xff6C63FF),
                ),

                const SizedBox(width: 8),

                Text(
                  "Kalender",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            TableCalendar(
              firstDay: DateTime.utc(2024),
              lastDay: DateTime.utc(2035),
              focusedDay: focusedDay,

              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },

              onDaySelected: (selected, focused) {
                setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                });
              },

              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              calendarStyle: CalendarStyle(

                todayDecoration: const BoxDecoration(
                  color: Color(0xffB388FF),
                  shape: BoxShape.circle,
                ),

                selectedDecoration: const BoxDecoration(
                  color: Color(0xff6C63FF),
                  shape: BoxShape.circle,
                ),

                weekendTextStyle: const TextStyle(
                  color: Colors.redAccent,
                ),

                defaultTextStyle:
                    GoogleFonts.poppins(),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xffF5F2FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [

                  const Icon(
                    Icons.today_rounded,
                    color: Color(0xff6C63FF),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      "Hari ini adalah kesempatan baru untuk menjadi lebih baik 🌱",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}