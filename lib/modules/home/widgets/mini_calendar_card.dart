import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MiniCalendarCard extends StatefulWidget {
  const MiniCalendarCard({super.key});

  @override
  State<MiniCalendarCard> createState() => _MiniCalendarCardState();
}

class _MiniCalendarCardState extends State<MiniCalendarCard> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_rounded,
                  color: Color(0xff6C63FF),
                ),

                const SizedBox(width: 8),

                Text(
                  "Calendar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            TableCalendar(
              firstDay: DateTime.utc(2020),
              lastDay: DateTime.utc(2035),
              focusedDay: _focusedDay,

              selectedDayPredicate: (day) =>
                  isSameDay(_selectedDay, day),

              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },

              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,

                titleTextStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),

                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: theme.colorScheme.onSurface,
                ),

                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: theme.colorScheme.onSurface,
                ),
              ),

              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                weekendStyle: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),

              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(
                  color: theme.colorScheme.onSurface,
                ),

                outsideTextStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                ),

                disabledTextStyle: TextStyle(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.25),
                ),

                weekendTextStyle: const TextStyle(
                  color: Colors.redAccent,
                ),

                todayDecoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),

                selectedDecoration: const BoxDecoration(
                  color: Color(0xff6C63FF),
                  shape: BoxShape.circle,
                ),

                selectedTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),

                todayTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),

                markerDecoration: const BoxDecoration(
                  color: Color(0xff6C63FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}