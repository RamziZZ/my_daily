import "package:flutter/material.dart";

class HistoryFilter extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const HistoryFilter({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xff6C63FF)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xff6C63FF),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color:
                selected ? Colors.white : const Color(0xff6C63FF),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}