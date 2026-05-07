import 'package:flutter_ossetian_learning_app/models/course.dart';

abstract class AbstractCourseRepository {
  void addCourse(Course course);

  void addAllCourses(List<Course> courses);

  List<Course> getAllCourses();

  Course? getCourseByIndex(int index);

  List<Course> getCoursesByCategory(String category);

  List<Course> getCoursesByRatingAbove(double minRating);

  List<Course> getCoursesByAuthor(String author);
  List<Course> searchCourses(String query);

  bool removeCourse(Course course);

  void clearAll();
  List<String> getUniqueAuthors();
}
