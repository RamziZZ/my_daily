import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingCard extends StatelessWidget {
  final String username;
  final String greeting;
  final String date;
  final String? photoUrl;

  const GreetingCard({
    super.key,
    required this.username,
    required this.greeting,
    required this.date,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final hasPhoto =
        photoUrl != null && photoUrl!.trim().isNotEmpty;

    final firstLetter =
        username.isNotEmpty ? username[0].toUpperCase() : "U";

    return Row(
      children: [

        /// Avatar
        Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff7B61FF),
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withValues(alpha: .15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: const Color(0xffECE8FF),

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
        ),

        const SizedBox(width: 16),

        /// Text
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
                ),
              ),

              const SizedBox(height: 5),

              Text(
                "Semangat menjalani hari yang produktif",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),

        /// Notification
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xffF3F0FF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Color(0xff6C63FF),
            ),
          ),
        ),
      ],
    );
  }
}