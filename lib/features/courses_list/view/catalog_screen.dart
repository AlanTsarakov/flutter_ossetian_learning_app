import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/interfaces/screen_with_title.dart';
import 'package:flutter_ossetian_learning_app/widgets/course_cards.dart';

class CatalogScreen extends StatefulWidget implements ScreenWithTitle {
  const CatalogScreen({super.key});

  @override
  String getTitle() => "Курсы";

  @override
  State<StatefulWidget> createState() => CatalogScreenState();
}

class CatalogScreenState extends State<CatalogScreen> {
  final List<String> categories = ["Популярное", "Новое", "Лучшее"];
  String _selectedCategory = "Популярное";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 12,
          children: [
            const SizedBox(width: 16),
            ...categories.map((category) {
              final isSelected = category == _selectedCategory;
              return isSelected
                  ? FilledButton(
                      onPressed: () =>
                          setState(() => _selectedCategory = category),
                      child: Text(category),
                    )
                  : OutlinedButton(
                      onPressed: () =>
                          setState(() => _selectedCategory = category),
                      child: Text(category),
                    );
            }),
          ],
        ),
        Expanded(child: CourseCards(category: _selectedCategory)),
      ],
    );
  }
}
