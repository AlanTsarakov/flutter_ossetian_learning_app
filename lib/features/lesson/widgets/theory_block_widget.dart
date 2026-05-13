import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class TheoryBlockWidget extends StatefulWidget {
  const TheoryBlockWidget({
    super.key,
    required this.block,
    required this.onNext,
  });
  final TheoryBlock block;
  final VoidCallback onNext;

  @override
  State<TheoryBlockWidget> createState() => _TheoryBlockWidgetState();
}

class _TheoryBlockWidgetState extends State<TheoryBlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Контент
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                widget.block.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(widget.block.content, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        _buildNavigationButtons(),
        // Кнопки навигации
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => widget.onNext(),
              child: const Text('Назад'),
            ),
            FilledButton(
              onPressed: () => widget.onNext(),
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
