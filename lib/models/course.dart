import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class Course {
  final int? id;
  bool isStarted = false;
  bool isCompleted = false;
  final String name;
  final String description;
  final double rating;
  final String author;
  final String urlPhoto;
  final String category;
  final List<Lesson> lessons;

  int get totalLessons => lessons.length;
  int get completedLessons => lessons.where((lesson) => lesson.isCompleted).length;
  double get progress => totalLessons == 0 ? 0 : completedLessons / totalLessons;

  Course({
    this.id,
    required this.urlPhoto,
    required this.name,
    required this.description,
    required this.rating,
    required this.author,
    required this.category,
    this.lessons = const [],
  });

  void markAsStarted() {
    isStarted = true;
  }
  void checkCompletion() => isCompleted = completedLessons == totalLessons;

  @override
  String toString() => 'Course(name: $name, category: $category)';
}