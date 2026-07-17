import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryCard extends StatelessWidget {
  final String mood;
  final String title;
  final String time;
  final String category;

  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const HistoryCard({
    super.key,
    required this.mood,
    required this.title,
    required this.time,
    required this.category,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(

      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [

          SlidableAction(
            onPressed: (_) => onEdit?.call(),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
            borderRadius: BorderRadius.circular(18),
          ),

        ],
      ),

      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [

          SlidableAction(
            onPressed: (_) => onDelete?.call(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Hapus',
            borderRadius: BorderRadius.circular(18),
          ),

        ],
      ),

      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 12),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        child: ListTile(

          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.deepPurple.shade50,
            child: Text(
              mood,
              style: const TextStyle(fontSize: 24),
            ),
          ),

          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text("$category • $time"),
          ),

          trailing: const Icon(Icons.chevron_right),

        ),
      ),
    );
  }
}