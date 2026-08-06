import 'package:flutter/material.dart';

class TargetSuccessMessage extends StatelessWidget {
  const TargetSuccessMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Target berhasil ditambahkan!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 12),

        Text(
          "Target akan ditampilkan di target hari ini.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}