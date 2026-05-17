import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/block.dart';

class FlashcardBlockWidget extends StatefulWidget {
  const FlashcardBlockWidget({
    super.key,
    required this.block,
    required this.onPrevious,
    required this.onNext,
  });

  final Block block;

  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  State<FlashcardBlockWidget> createState() => _FlashcardBlockWidgetState();
}

class _FlashcardBlockWidgetState extends State<FlashcardBlockWidget> {
  var _showBack = false;

  Widget _buildNavigationButtons(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => {widget.onPrevious()},
              child: const Text('Назад'),
            ),
            FilledButton(
              onPressed: () => {widget.onNext()},
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = {'front': widget.block.front, 'back': widget.block.back};
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(widget.block.title, textAlign: .center),
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
                        _showBack
                            ? (card['back'] as String)
                            : (card['front'] as String),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Нажмите, чтобы перевернуть',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        _buildNavigationButtons(context),
      ],
    );
  }
}
