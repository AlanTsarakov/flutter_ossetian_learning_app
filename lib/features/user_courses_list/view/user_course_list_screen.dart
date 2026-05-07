import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/interfaces/screen_with_title.dart';
import 'package:flutter_ossetian_learning_app/widgets/course_cards.dart';

class MainScreen extends StatefulWidget implements ScreenWithTitle{
  const MainScreen({super.key});



  @override
  String getTitle() => "Главное";  
  
  @override
  State<StatefulWidget> createState() => MainScreenState();
  
}

class MainScreenState extends State<MainScreen> {
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return CourseCards(category: "Популярное");
  }
}