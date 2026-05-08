import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/widgets/course_cards.dart';
import 'package:flutter_ossetian_learning_app/widgets/flash_cards_list.dart';

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
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: true,
      ),
      body: FlashCardsWidget(),
    );
  }
}