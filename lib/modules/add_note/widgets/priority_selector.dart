import 'package:flutter/material.dart';

class PrioritySelector extends StatelessWidget {

  final String priority;
  final Function(String) onSelect;

  const PrioritySelector({
    super.key,
    required this.priority,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    Widget chip(String title, Color color){
      final selected = priority==title;
      return ChoiceChip(

        label: Text(title),
        selected: selected,
        selectedColor: color,
        onSelected: (_){
          onSelect(title);
        },
      );
    }

    return Wrap(
      spacing: 12,
      children: [
        chip("High",Colors.red),
        chip("Medium",Colors.orange),
        chip("Low",Colors.green),
      ],
    );
  }
}