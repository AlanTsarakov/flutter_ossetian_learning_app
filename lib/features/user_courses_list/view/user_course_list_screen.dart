import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';
import 'package:flutter_ossetian_learning_app/widgets/course_widget.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final courses = GetIt.I<AbstractCourseRepository>().getCoursesByCategory(
      "Популярное",
    );
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          width: double.infinity,
          child: Text(
            'Каталог',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: .only(bottom: 16, left: 16, right: 16),
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
