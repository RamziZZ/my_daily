import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  final String username;
  final String subtitle;
  final String? photoUrl;

  const HomeHeader({
    super.key,
    required this.username,
    required this.subtitle,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhoto =
        photoUrl != null && photoUrl!.trim().isNotEmpty;

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final firstLetter =
        username.isNotEmpty
            ? username[0].toUpperCase()
            : "U";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xff1E1E1E)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),

      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey.shade200,
            backgroundImage:
                hasPhoto ? NetworkImage(photoUrl!) : null,
            child: !hasPhoto
                ? Text(
                    firstLetter,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, $username",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: isDark
                        ? Colors.white70
                        : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}