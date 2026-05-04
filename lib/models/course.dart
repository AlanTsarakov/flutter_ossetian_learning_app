class Course {
  final int? id;
  final String name;
  final String description;
  final double rating;
  final String author;
  final String urlPhoto;
  final String category;
  
  const Course({
    this.id,
    required this.urlPhoto,
    required this.name,
    required this.description,
    required this.rating,
    required this.author,
    required this.category,
  });
  
  // Для отладки
  @override
  String toString() => 'Course(name: $name, category: $category)';
}