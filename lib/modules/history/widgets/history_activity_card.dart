import 'package:flutter/material.dart';

class HistoryActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emoji;
  final String time;

  const HistoryActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness ==
                Brightness.dark
            ? const Color(0xff181825)
            : const Color(0xffF4E8F9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle),
                Text(time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}