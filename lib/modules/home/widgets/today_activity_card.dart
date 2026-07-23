import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayActivityCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String time;

  const TodayActivityCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.time,
  });

  IconData _getIcon() {
    final text = title.toLowerCase();

    if (text.contains("flutter") ||
        text.contains("coding") ||
        text.contains("program")) {
      return Icons.laptop_mac_rounded;
    }

    if (text.contains("meeting")) {
      return Icons.groups_rounded;
    }

    if (text.contains("olahraga") ||
        text.contains("gym") ||
        text.contains("lari")) {
      return Icons.directions_run_rounded;
    }

    if (text.contains("kuliah") ||
        text.contains("belajar")) {
      return Icons.menu_book_rounded;
    }

    return Icons.event_note_rounded;
  }

  Color _getColor() {
    final text = title.toLowerCase();

    if (text.contains("flutter") ||
        text.contains("coding")) {
      return const Color(0xffEEF3FF);
    }

    if (text.contains("meeting")) {
      return const Color(0xffFFF3E6);
    }

    if (text.contains("olahraga")) {
      return const Color(0xffE9FFF1);
    }

    return const Color(0xffF5F5F5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [

          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: _getColor(),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              _getIcon(),
              color: const Color(0xff6C63FF),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [

                    const Icon(
                      Icons.schedule,
                      size: 16,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      time,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Text(
            emoji,
            style: const TextStyle(fontSize: 26),
          ),
        ],
      ),
    );
  }
}