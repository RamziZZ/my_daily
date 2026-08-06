import 'package:flutter/material.dart';

class RegisterNameField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  const RegisterNameField({
    super.key,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        const Text("Nama Lengkap"),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
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