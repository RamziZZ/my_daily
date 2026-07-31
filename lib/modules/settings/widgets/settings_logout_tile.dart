import 'package:flutter/material.dart';

class SettingsLogoutTile extends StatelessWidget {
  final VoidCallback onTap;

  const SettingsLogoutTile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(
          Icons.logout_rounded,
          color: Colors.red,
        ),
        title: const Text(
          "Logout",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: const Text(
          "Keluar dari akun saat ini",
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.red,
        ),
      ),
    );
  }
}