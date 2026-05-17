import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/block.dart';

class QuizBlockWidget extends StatefulWidget {
  const QuizBlockWidget({
    super.key,
    required this.block,
    required this.onPrevious,
    required this.onNext,
  });
  final Block block;

  final VoidCallback onNext;
  final VoidCallback onPrevious;
  @override
  State<QuizBlockWidget> createState() => _QuizBlockWidgetState();
}

class _QuizBlockWidgetState extends State<QuizBlockWidget> {
  final Set<int> _selected = {};

  void checkCorrectAnswer(BuildContext context) {
    if (widget.block.correctChoiceIndices == null) {
      return;
    }

    bool isCorrect = setEquals(
      _selected,
      widget.block.correctChoiceIndices!.toSet(),
    );

    if (isCorrect) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: .all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.check_circle, color: Colors.green),
                      title: Text('Правильно!'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _selected.clear();
                        widget.onNext();
                      },
                      child: const Text('Далее'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: .all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.error, color: Colors.red),
                      title: Text('Неправильно. Попробуйте еще раз.'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Закрыть'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: .all(16),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const SizedBox(height: 24),
                Text(
                  widget.block.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                Column(
                  children: widget.block.choices!.asMap().entries.map((e) {
                    return CheckboxListTile(
                      value: _selected.contains(e.key),
                      title: Text(e.value),
                      onChanged: (bool? checked) {
                        setState(() {
                          if (checked == true) {
                            _selected.add(e.key);
                          } else {
                            _selected.remove(e.key);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        _buildNavigationButtons(context),
      ],
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: widget.onPrevious,
              child: const Text('Назад'),
            ),
            FilledButton(
              onPressed: () => checkCorrectAnswer(context),
              child: Text('Далее'),
            ),
          ],
        ),
      ),
    );
  }
}
