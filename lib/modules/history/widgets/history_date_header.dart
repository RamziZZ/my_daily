import 'package:flutter/material.dart';

class HistoryDateHeader extends StatelessWidget {

  final String date;

  const HistoryDateHeader({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  }
}