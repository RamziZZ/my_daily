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

    final firstLetter =
        username.isNotEmpty ? username[0].toUpperCase() : "U";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff6C63FF),
            Color(0xff8B7BFF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.20),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          /// Avatar
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage:
                hasPhoto ? NetworkImage(photoUrl!) : null,
            child: !hasPhoto
                ? Text(
                    firstLetter,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff6C63FF),
                    ),
                  )
                : null,
          ),

          const SizedBox(width: 16),

          /// Greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, $username 👋",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          /// Notification
          Container(
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {
                // TODO: Notification
              },
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}