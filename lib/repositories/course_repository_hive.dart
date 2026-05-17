import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/course.dart'; // Путь к вашей модели

class CourseRepositoryHive implements AbstractCourseRepository {
  // Имя коробки в Hive
  static const String _boxName = 'courses';

  // Получаем доступ к открытой коробке
  Box<Course> get _box => Hive.box<Course>(_boxName);

  // Геттер для получения всех курсов из Hive в виде обычного списка List<Course>
  List<Course> get _courses => _box.values.toList();

  @override
  void addCourse(Course course) {
    // Сохраняем по id. Если курс с таким id есть, он обновится
    _box.put(course.id, course);
  }

  @override
  void addAllCourses(List<Course> courses) {
    // putAll сохраняет всю пачку за один эффективный проход
    final entries = {for (var c in courses) c.id: c};
    _box.putAll(entries);
  }

  @override
  List<Course> getAllCourses() {
    return List.unmodifiable(_courses);
  }

  @override
  Course? getCourseByIndex(int index) {
    // В Hive можно получать данные и по индексу в коробке
    if (index >= 0 && index < _box.length) {
      return _box.getAt(index);
    }
    return null;
  }

  // Дополнительный удобный метод (NoSQL style)
  Course? getCourseById(String id) {
    return _box.get(id);
  }

  @override
  List<Course> getCoursesByCategory(String category) {
    return _courses.where((course) => course.category == category).toList();
  }

  @override
  List<Course> getCoursesByRatingAbove(double minRating) {
    return _courses.where((course) => course.rating >= minRating).toList();
  }

  @override
  List<Course> getCoursesByAuthor(String author) {
    return _courses.where((course) => course.author == author).toList();
  }

  @override
  List<Course> searchCourses(String query) {
    if (query.isEmpty) return [];
    final lowerQuery = query.toLowerCase();
    return _courses.where((course) {
      return course.name.toLowerCase().contains(lowerQuery) ||
          course.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  @override
  bool removeCourse(Course course) {
    if (_box.containsKey(course.id)) {
      _box.delete(course.id);
      return true;
    }
    return false;
  }

  @override
  void clearAll() {
    _box.clear(); // Полностью очищает коробку на диске
  }

  @override
  List<String> getUniqueAuthors() {
    return _courses.map((c) => c.author).toSet().toList();
  }

  @override
  List<Course> getStartedCourses() {
    return _courses.where((course) => course.isStarted == true).toList();
  }
}