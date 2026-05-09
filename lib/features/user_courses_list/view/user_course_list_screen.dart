import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/course/view/course_detail_screen.dart';
import 'package:flutter_ossetian_learning_app/interfaces/screen_with_title.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';
import 'package:flutter_ossetian_learning_app/widgets/course_widget.dart';
import 'package:get_it/get_it.dart';


class MainScreen extends StatefulWidget implements ScreenWithTitle{
  const MainScreen({super.key});



  @override
  String getTitle() => "Главное";  
  
  @override
  State<StatefulWidget> createState() => MainScreenState();
  
}

class MainScreenState extends State<MainScreen> {
  
  
  
  
  @override
  Widget build(BuildContext context) {
    final courses = GetIt.I<AbstractCourseRepository>().getCoursesByCategory("Популярное");
    return ListView.builder(
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
          );
  }
}