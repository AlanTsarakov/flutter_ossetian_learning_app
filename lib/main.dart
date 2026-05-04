import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/interfaces/screen_with_title.dart';
import 'package:flutter_ossetian_learning_app/screens/catalog_screen.dart';
import 'package:flutter_ossetian_learning_app/screens/main_screen.dart';
import 'package:flutter_ossetian_learning_app/screens/profile_screen.dart';
import 'package:flutter_ossetian_learning_app/theme.dart';
import 'package:flutter_ossetian_learning_app/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: .system,
      darkTheme: MaterialTheme(createTextTheme(context, "Roboto", "Roboto")).dark(),
      theme: MaterialTheme(createTextTheme(context, "Roboto", "Roboto")).light(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<Widget> screens = [
    MainScreen(),
    CatalogScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text((screens[_currentScreenIndex] as ScreenWithTitle).getTitle())],
          mainAxisAlignment: .center,),
      ),
      body: screens[_currentScreenIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentScreenIndex,
        onDestinationSelected: (value) => setState(() {
          _currentScreenIndex = value;
        }),
        destinations: [
        NavigationDestination(icon: Icon(Icons.favorite_border), label: "Главное"),
        NavigationDestination(icon: Icon(Icons.search), label: "Каталог"),
        NavigationDestination(icon: Icon(Icons.account_circle), label: "Профиль")
      ]),
    );
  }
}
