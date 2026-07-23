import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodCard extends StatelessWidget {

  final String emoji;
  final String mood;

  const MoodCard({
    super.key,
    required this.emoji,
    required this.mood,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      elevation: 1,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),

      child: Padding(

        padding: const EdgeInsets.all(20),

        child: Row(

          children: [

            Container(

              width: 70,
              height: 70,

              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Center(
                child: Text(
                  emoji,
                  style: const TextStyle(
                    fontSize: 34,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 18),

            Expanded(

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Mood Hari Ini",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    mood,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}