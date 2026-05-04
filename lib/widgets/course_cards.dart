import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/repositories/course_repository_in_memory.dart';
import 'package:flutter_ossetian_learning_app/screens/course_detail_screen.dart';

final CourseRepositoryInMemory coursesRepository = CourseRepositoryInMemory();

class CourseCards extends StatelessWidget {
  const CourseCards({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    final courses = coursesRepository.getCoursesByCategory(category);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, i) {
        final r = courses[i];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => CourseDetailScreen(course: r),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(padding: .all(5),),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: r.urlPhoto,
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.primaries[i % Colors.primaries.length]
                          .withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          r.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber[700],
                            ),
                            Text(
                              ' ${r.rating}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              ' • ${r.author}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
