import 'package:flutter/material.dart';

class HistorySearch extends StatelessWidget {

  final ValueChanged<String> onChanged;
  const HistorySearch({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Cari aktivitas...",
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.tune),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}