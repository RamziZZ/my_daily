import 'package:flutter/material.dart';

class RegisterConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  final bool obscure;
  final VoidCallback onToggle;

  const RegisterConfirmPasswordField({
    super.key,
    required this.controller,
    required this.validator,
    required this.obscure,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        const Text("Konfirmasi Kata Sandi"),

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