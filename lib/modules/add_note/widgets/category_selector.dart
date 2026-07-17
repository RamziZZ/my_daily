import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onSelect;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Belajar",
        "icon": Icons.menu_book,
        "color": Colors.blue,
      },
      {
        "title": "Kerja",
        "icon": Icons.work,
        "color": Colors.orange,
      },
      {
        "title": "Olahraga",
        "icon": Icons.sports_soccer,
        "color": Colors.green,
      },
      {
        "title": "Meeting",
        "icon": Icons.groups,
        "color": Colors.purple,
      },
      {
        "title": "Personal",
        "icon": Icons.favorite,
        "color": Colors.red,
      },
      {
        "title": "Lainnya",
        "icon": Icons.apps,
        "color": Colors.grey,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        final item = categories[index];

        final selected = selectedCategory == item["title"];

        return GestureDetector(
          onTap: () => onSelect(item["title"] as String),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: selected
                  ? (item["color"] as Color)
                  : Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected
                    ? Colors.transparent
                    : Colors.grey.shade300,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Icon(
                  item["icon"] as IconData,
                  size: 30,
                  color: selected
                      ? Colors.white
                      : item["color"] as Color,
                ),

                const SizedBox(height: 10),

                Text(
                  item["title"] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selected
                        ? Colors.white
                        : null,
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}