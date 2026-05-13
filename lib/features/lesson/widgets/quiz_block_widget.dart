import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class QuizBlockWidget extends StatefulWidget {
  const QuizBlockWidget({super.key, required this.block, required this.onNext});
  final QuizBlock block;

  final VoidCallback onNext;
  @override
  State<QuizBlockWidget> createState() => _QuizBlockWidgetState();
}

class _QuizBlockWidgetState extends State<QuizBlockWidget> {
  Set<int> _selected = {};

  void checkCorrectAnswer(BuildContext context) {
    bool isCorrect = setEquals(
      _selected,
      widget.block.correctChoiceIndices.toSet(),
    );

    if (isCorrect) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Правильно!'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onNext();
                },
                child: const Text('Далее'),
              ),
            ],
          );
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            padding: .all(16),
            children: [
              const ListTile(
                leading: Icon(Icons.error, color: Colors.red),
                title: Text('Неправильно! Попробуйте еще раз'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Закрыть'),
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
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                widget.block.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              Column(
                children: widget.block.choices.asMap().entries.map((e) {
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
            TextButton(onPressed: () => {}, child: const Text('Назад')),
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
