import 'package:flutter/material.dart';

class MoodSelector extends StatelessWidget {
  final String selectedMood;
  final Function(String) onSelect;

  const MoodSelector({
    super.key,
    required this.selectedMood,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final moods = [
      {"emoji": "😀", "label": "Senang"},
      {"emoji": "😊", "label": "Tenang"},
      {"emoji": "😐", "label": "Biasa"},
      {"emoji": "😔", "label": "Sedih"},
      {"emoji": "😡", "label": "Marah"},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: moods.map((mood) {
        final emoji = mood["emoji"]!;
        final label = mood["label"]!;
        final selected = emoji == selectedMood;

        return GestureDetector(
          onTap: () => onSelect(emoji),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: 95,
            padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: selected
                  ? const Color(0xff6C63FF)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected
                    ? const Color(0xff6C63FF)
                    : Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: selected
                      ? const Color(0xff6C63FF).withValues(alpha: 0.25)
                      : Colors.black.withValues(alpha: 0.05),
                  blurRadius: selected ? 18 : 8,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                if (selected)
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),

                Column(
                  children: [
                    AnimatedScale(
                      scale: selected ? 1.25 : 1,
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 34),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: selected
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}