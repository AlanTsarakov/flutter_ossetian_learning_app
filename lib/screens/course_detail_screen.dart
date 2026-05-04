import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            Stack(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
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
                  
                  Text(widget.course.author, style: Theme.of(context).textTheme.labelSmall,),
                  Column(children: [
                    Text("Дата публикации:", style: Theme.of(context).textTheme.labelSmall,),
                    Text("03.05.26", style: Theme.of(context).textTheme.labelSmall,),
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
