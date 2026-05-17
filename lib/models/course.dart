import 'package:hive/hive.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

part 'course.g.dart';

@HiveType(typeId: 0)
class Course {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  bool isStarted = false;
  @HiveField(2)
  bool isCompleted = false;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final double rating;
  @HiveField(6)
  final String author;
  @HiveField(7)
  final String urlPhoto;
  @HiveField(8)
  final String category;
  @HiveField(9)
  final List<Lesson> lessons;
  @HiveField(12)
  final int version;

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
    this.version = 1,
    this.lessons = const [],
  });

  void markAsStarted() {
    isStarted = true;
  }
  void checkCompletion() => isCompleted = completedLessons == totalLessons;

  @override
  String toString() => 'Course(name: $name, category: $category)';
}