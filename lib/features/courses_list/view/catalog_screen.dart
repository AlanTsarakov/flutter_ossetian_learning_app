import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/course/view/course_detail_screen.dart';
import 'package:flutter_ossetian_learning_app/interfaces/screen_with_title.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';

import 'package:flutter_ossetian_learning_app/widgets/course_widget.dart';
import 'package:get_it/get_it.dart';

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
    final courses = GetIt.I<AbstractCourseRepository>().getCoursesByCategory(
      _selectedCategory,
    );
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
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: courses.length,
            itemBuilder: (context, i) {
              final course = courses[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            CourseDetailScreen(course: course),
                      ),
                    );
                  },
                  child: CourseWidget(course: course),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
