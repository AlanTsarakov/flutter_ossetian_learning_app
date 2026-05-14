import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/lesson/view/lesson_screen.dart';
import 'package:flutter_ossetian_learning_app/models/course.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.course});
  final Course course;
  @override
  State<StatefulWidget> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.course.name,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: .all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          imageUrl: widget.course.urlPhoto,
                          fit: BoxFit.cover,
                          width: .maxFinite,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ),
                      // BackdropFilter(
                      //   filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                      //   child: Container(
                      //     width: double.infinity,
                      //     height: MediaQuery.of(context).size.height * 0.3,
                      //     color: Colors.black.withOpacity(0.1),
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.directional(
                      start: 16,
                      end: 16,
                      top: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          widget.course.author,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Column(
                          children: [
                            Text(
                              "Дата публикации:",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              "03.05.26",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.directional(
                      start: 16,
                      end: 16,
                      top: 8,
                    ),
                    child: Text(widget.course.description),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.course.totalLessons,
                    itemBuilder: (BuildContext context, int index) {
                      if (index < widget.course.completedLessons) {
                        return ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          title: Text(widget.course.lessons[index].title),
                          subtitle: Text(
                            widget.course.lessons[index].description,
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          onTap: () {},
                        );
                      } else if (index > widget.course.completedLessons) {
                        return ListTile(
                          enabled: false,
                          leading: Text(
                            '${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          title: Text(widget.course.lessons[index].title),
                          subtitle: Text(
                            widget.course.lessons[index].description,
                          ),
                          trailing: Icon(Icons.lock),
                          onTap: () {},
                        );
                      } else {
                        return ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          title: Text(widget.course.lessons[index].title),
                          subtitle: Text(
                            widget.course.lessons[index].description,
                          ),
                          trailing: Icon(Icons.play_circle_filled),
                          onTap: () async {
                            var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LessonScreen(
                                  lesson: widget.course.lessons[index],
                                  onLessonComplete: () => setState(() {}),
                                ),
                              ),
                            );
                            if (result == true) {
                              setState(() {});
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            (widget.course.isStarted == false)
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.course.markAsStarted();
                      });
                    },
                    child: const Text('Начать учиться'),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
