import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String username;

  const ProfileCard({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .shadowColor
                .withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: color.primary.withValues(alpha: .12),
            child: Icon(
              Icons.person,
              size: 42,
              color: color.primary,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "MyDaily User",
            style: TextStyle(
              color: color.onSurface.withValues(alpha: .6),
            ),
          ),
        ],
      ),
    );
  }
}