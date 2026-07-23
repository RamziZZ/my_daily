import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyActivity extends StatelessWidget {
  const EmptyActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Column(

        children: [

          const Icon(
            Icons.event_busy,
            size: 60,
            color: Colors.grey,
          ),

          const SizedBox(height: 15),

          Text(
            "Belum Ada Aktivitas",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Tambahkan aktivitas pertamamu",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}