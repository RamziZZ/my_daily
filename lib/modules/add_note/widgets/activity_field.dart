import 'package:flutter/material.dart';

class ActivityField extends StatelessWidget {
  final TextEditingController controller;

  const ActivityField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Nama Aktivitas",
        hintText: "Tulis Nama Aktivitas",
        prefixIcon: const Icon(Icons.edit_note_rounded),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}