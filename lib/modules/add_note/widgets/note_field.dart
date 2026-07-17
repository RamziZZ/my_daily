import 'package:flutter/material.dart';

class NoteField extends StatelessWidget {

  final TextEditingController controller;

  const NoteField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(

      controller: controller,

      maxLines: 5,

      decoration: InputDecoration(

        hintText: "Tulis catatan tambahan untuk aktivitas ini",

        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(18),

        ),

      ),

    );

  }
}