class Course {
  final int? id;
  bool isStarted = false;
  final String name;
  final String description;
  final double rating;
  final String author;
  final String urlPhoto;
  final String category;

  Course({
    this.id,
    required this.urlPhoto,
    required this.name,
    required this.description,
    required this.rating,
    required this.author,
    required this.category,
  });

  void markAsStarted() {
    isStarted = true;
  }

  @override
  String toString() => 'Course(name: $name, category: $category)';
}