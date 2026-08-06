import 'package:flutter/material.dart';

class ForgotPasswordEmailField
    extends StatelessWidget {

  final TextEditingController controller;
  final String? Function(String?) validator;

  const ForgotPasswordEmailField({
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

        const Text("Email"),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType:
              TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText:
                "Masukkan Email Anda",
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