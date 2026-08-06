import 'package:flutter/material.dart';

class AddTargetTimeField extends StatelessWidget {
  final TextEditingController controller;

  const AddTargetTimeField({
    super.key,
    required this.controller,
  });

  Future<void> _pickTime(
    BuildContext context,
  ) async {
    final result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (result != null) {
      controller.text =
          "${result.hour.toString().padLeft(2, '0')}:${result.minute.toString().padLeft(2, '0')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          "Waktu",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          readOnly: true,
          onTap: () => _pickTime(context),

          decoration: InputDecoration(
            hintText: "Contoh : 19:00",

            suffixIcon: const Icon(
              Icons.access_time,
            ),

            filled: true,
            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}