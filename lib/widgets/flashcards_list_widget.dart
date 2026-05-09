import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/flashcard.dart';
import 'package:flutter_ossetian_learning_app/repositories/flashcard_repository.dart';
import 'package:get_it/get_it.dart';

class FlashCardsWidget extends StatelessWidget {
  const FlashCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Flashcard> cards = GetIt.I<FlashcardRepository>().getAll();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: cards.length,
      itemBuilder: (context, i) {
        final r = cards[i];
        return GestureDetector(
          onTap: () {
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
                    decoration: BoxDecoration(
                      color: Colors.primaries[i % Colors.primaries.length]
                          .withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // child: CachedNetworkImage(
                    //   placeholder: (context, url) =>
                    //       CircularProgressIndicator(padding: .all(5)),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    //   imageUrl: r.urlPhoto,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          r.ossetianWord,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          r.russianWord,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          children: [
                            Text("Пример: ${r.exampleSentence}",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
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
