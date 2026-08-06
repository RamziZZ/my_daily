import 'package:flutter/material.dart';

class TargetQuoteCard extends StatelessWidget {
  const TargetQuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE9C7FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.favorite,
            color: Colors.purple,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Disiplin hari ini adalah sukses di masa depan.",
            ),
          ),
        ],
      ),
    );
  }
}