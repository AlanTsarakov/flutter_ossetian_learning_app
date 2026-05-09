import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/widgets/flashcards_list_widget.dart';

class CardsListScreen extends StatefulWidget {
  const CardsListScreen({super.key});

  @override
  State<StatefulWidget> createState() => CardsListScreenState();
  
}

class CardsListScreenState extends State<CardsListScreen> {
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Карточки",
        ),
        centerTitle: true,
      ),
      body: FlashCardsWidget(),
    );
  }
}