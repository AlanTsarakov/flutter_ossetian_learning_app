import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';

import 'package:flutter_ossetian_learning_app/widgets/course_widget.dart';
import 'package:get_it/get_it.dart';

class CatalogScreen extends StatefulWidget {
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

    final textTheme = Theme.of(context).textTheme;
    final courses = GetIt.I<AbstractCourseRepository>().getCoursesByCategory(
      _selectedCategory,
    );
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          width: double.infinity,
          child: Text(
            'Каталог',
            style: textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
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
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: courses.length,
            itemBuilder: (context, i) {
              final course = courses[i];
              return CourseWidget(course: course);
            },
          ),
        ),
      ],
    );
  }
}
