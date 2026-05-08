import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/cards_list/card_list.dart';

class AdaptiveCards extends StatelessWidget {
  const AdaptiveCards(this.width, {super.key});

  final width;

  @override
  Widget build(BuildContext context) {
    if (width > 768) {
      return Column(
        children: [
          Column(
            children: [
              Card(child: Row(children: [SizedBox(height: 80)])),
              Card(child: Row(children: [SizedBox(height: 80)])),
            ],
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => CardsListScreen(),
              ),
            );
          },
          child: Card(
            child: SizedBox(
              width: width * 0.4,
              height: 80,
              child: Column(
                mainAxisAlignment: .center,
                spacing: 10,
                children: [
                  Text("190", style: Theme.of(context).textTheme.labelLarge),
                  Text(
                    "Выучено слов",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ),

        Card(
          child: SizedBox(
            width: width * 0.4,
            height: 80,
            child: Column(
              mainAxisAlignment: .center,
              spacing: 10,
              children: [
                Text("190", style: Theme.of(context).textTheme.labelLarge),
                Text("Знаю", style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
