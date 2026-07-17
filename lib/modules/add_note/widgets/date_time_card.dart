import 'package:flutter/material.dart';

class DateTimeCard extends StatelessWidget {
  final String date;
  final String time;
  final VoidCallback onDateTap;
  final VoidCallback onTimeTap;

  const DateTimeCard({
    super.key,
    required this.date,
    required this.time,
    required this.onDateTap,
    required this.onTimeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onDateTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today,color: Color(0xff6C63FF)),
                  const SizedBox(width:10),
                  Expanded(
                    child: Text(date),
                  )
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width:15),

        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onTimeTap,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(Icons.access_time,color: Color(0xff6C63FF)),
                  const SizedBox(width:10),
                  Expanded(
                    child: Text(time),
                  )
                ],
              ),
            ),
          ),
        ),

      ],
    );
  }
}