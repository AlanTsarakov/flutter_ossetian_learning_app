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
    final courses = GetIt.I<AbstractCourseRepository>().getStartedCourses();
    return Column(
      children: [
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
