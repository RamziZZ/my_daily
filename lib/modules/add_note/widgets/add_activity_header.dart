import 'package:flutter/material.dart';

class AddActivityHeader extends StatelessWidget {
  const AddActivityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Tambah Aktivitas",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      color: const Color(0xff7B4DFF),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          "Tambahkan aktivitasmu hari ini.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        const SizedBox(height: 20),

        const Text(
          "Kategori Aktivitas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}