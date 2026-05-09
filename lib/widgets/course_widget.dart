import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/course/view/course_detail_screen.dart';
import 'package:flutter_ossetian_learning_app/models/course.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key, required this.course});

  final Course course;
  @override
  Widget build(BuildContext context) {
    Random rnd = Random();
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => CourseDetailScreen(course: course),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.primaries[rnd.nextInt(Colors.primaries.length)]
                      .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      CircularProgressIndicator(padding: .all(5)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl: course.urlPhoto,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      course.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.amber[700]),
                        Text(
                          ' ${course.rating}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          ' • ${course.author}',
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
  }
}
