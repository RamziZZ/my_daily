import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              Icons.favorite,
              color: color.primary,
              size: 38,
            ),

            const SizedBox(height: 14),

            const Text(
              "MyDaily",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Version 1.0.0",
              style: TextStyle(
                color:
                    color.onSurface.withValues(alpha: .65),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              "Build with Ramzi X PT OtakKanan",
              style: TextStyle(
                color:
                    color.onSurface.withValues(alpha: .65),
              ),
            ),
          ],
        ),
      ),
    );
  }
}