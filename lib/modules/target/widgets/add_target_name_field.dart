import 'package:flutter/material.dart';

class AddTargetNameField extends StatelessWidget {
  final TextEditingController controller;

  const AddTargetNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          "Nama Target",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Contoh : Olahraga",

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