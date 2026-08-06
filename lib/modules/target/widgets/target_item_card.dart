import 'package:flutter/material.dart';
import 'package:my_daily/data/models/target_model.dart';

class TargetItemCard extends StatelessWidget {
  final TargetModel target;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TargetItemCard({
    super.key,
    required this.target,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: GestureDetector(
          onTap: onToggle,
          child: Icon(
            target.completed
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: target.completed
                ? Colors.green
                : Colors.grey,
          ),
        ),
        title: Text(target.title),
        subtitle: Text(target.time),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}