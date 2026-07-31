import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),

        Positioned(
          top: -50,
          right: -50,
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? const Color(0xFF3B5F4C).withOpacity(0.15)
                  : const Color(0xFFD8F7E5).withOpacity(0.5),
            ),
          ),
        ),

        Positioned(
          top: 250,
          left: -40,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? const Color(0xFF5E5A2B).withOpacity(0.12)
                  : const Color(0xFFF6F3B8).withOpacity(0.4),
            ),
          ),
        ),

        Positioned(
          bottom: 80,
          left: -60,
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? const Color(0xFF394A89).withOpacity(0.15)
                  : const Color(0xFFD9DFFF).withOpacity(0.5),
            ),
          ),
        ),

        child,
      ],
    );
  }
}