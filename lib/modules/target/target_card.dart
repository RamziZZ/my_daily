import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_daily/app/routes/app_routes.dart';

class TargetCard extends StatelessWidget {
  const TargetCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Target Hari Ini",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.target);
                },
                child: const Text(
                  "Tambah Target",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _TargetItem(
                title: "Belajar",
                done: true,
              ),
              _TargetItem(
                title: "Olahraga",
                done: true,
              ),
              _TargetItem(
                title: "Minum Air",
                done: true,
              ),
              _TargetItem(
                title: "Membaca",
                done: false,
              ),
              _TargetItem(
                title: "Tidur",
                done: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TargetItem extends StatelessWidget {
  final String title;
  final bool done;

  const _TargetItem({
    required this.title,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          done
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: done
              ? Colors.green
              : Colors.grey,
          size: 30,
        ),

        const SizedBox(height: 8),

        SizedBox(
          width: 55,
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}