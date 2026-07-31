import 'package:flutter/material.dart';

class HistoryFilterTabs extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const HistoryFilterTabs({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        _button('Semua'),
        _button('Target'),
        _button('Aktivitas'),
      ],
    );
  }

  Widget _button(String title) {
    final active = selected == title;

    return GestureDetector(
      onTap: () => onChanged(title),
      child: Container(
        width: 78,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active
              ? const Color(0xff7B4DFF)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xff7B4DFF),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color:
                active ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}