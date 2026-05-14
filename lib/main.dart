import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/courses_list/course_list.dart';
import 'package:flutter_ossetian_learning_app/features/user_courses_list/user_courses_list.dart';
import 'package:flutter_ossetian_learning_app/features/profile/profile.dart';
import 'package:flutter_ossetian_learning_app/repositories/abstract_course_repository.dart';
import 'package:flutter_ossetian_learning_app/repositories/course_repository_in_memory.dart';
import 'package:flutter_ossetian_learning_app/repositories/flashcard_repository.dart';
import 'package:flutter_ossetian_learning_app/theme/theme.dart';
import 'package:flutter_ossetian_learning_app/theme/util.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerSingleton<AbstractCourseRepository>(
    CourseRepositoryInMemory(),
  );
  GetIt.instance.registerSingleton(FlashcardRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/": (context) => MyHomePage(title: "Adam")},
      title: 'Flutter Demo',
      themeMode: .system,
      darkTheme: MaterialTheme(
        createTextTheme(context, "Roboto", "Roboto"),
      ).dark(),
      theme: MaterialTheme(
        createTextTheme(context, "Roboto", "Roboto"),
      ).light(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentScreenIndex = 0;
  List<(String, Widget)> screens = [
    ("Главное", MainScreen()),
    ("Каталог", CatalogScreen()),
    ("Профиль", ProfileScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screens[_currentScreenIndex].$1)),
      body: screens[_currentScreenIndex].$2,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentScreenIndex,
        onDestinationSelected: (value) => setState(() {
          _currentScreenIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: "Главное",
          ),
          NavigationDestination(icon: Icon(Icons.search), label: "Каталог"),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: "Профиль",
          ),
        ],
      ),
    );
  }
}
