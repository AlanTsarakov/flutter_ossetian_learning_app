import 'package:flutter/material.dart';

class Flashcard extends StatefulWidget {
  const Flashcard({super.key, required this.ossetianWord, required this.russianWord });

  final String ossetianWord;
  final String russianWord;
  


  @override
  State<Flashcard> createState() => _FlashcardState();
}

class _FlashcardState extends State<Flashcard> {
  var _showBack = false;

  @override
  Widget build(BuildContext context) {
    final card = {'front': widget.ossetianWord, 'back': widget.russianWord};
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => _showBack = !_showBack),
              child: Container(
                width: 320,
                height: 200,
                margin: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: _showBack
                      ? Colors.blue.withValues(alpha: 0.2)
                      : Colors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      _showBack ? (card['front'] as String) : (card['back'] as String),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
            Text('Tap to flip', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
