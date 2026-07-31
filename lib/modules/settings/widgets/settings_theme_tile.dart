import 'package:flutter/material.dart';

class SettingsThemeTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsThemeTile({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.dark_mode_rounded,
          color: Color(0xff6C63FF),
        ),
        title: const Text(
          "Mode Gelap",
        ),
        subtitle: const Text(
          "Aktifkan tampilan gelap",
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}