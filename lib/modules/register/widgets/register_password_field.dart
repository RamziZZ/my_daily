import 'package:flutter/material.dart';

class RegisterPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  final bool obscure;
  final VoidCallback onToggle;

  const RegisterPasswordField({
    super.key,
    required this.controller,
    required this.validator,
    required this.obscure,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Kata Sandi"),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscure,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: IconButton(
              onPressed: onToggle,
              icon: Icon(
                obscure
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
        ),
      ],
    );
  }
}