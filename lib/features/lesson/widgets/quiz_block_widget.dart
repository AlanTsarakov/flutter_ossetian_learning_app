import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class QuizBlockWidget extends StatefulWidget {
  const QuizBlockWidget({super.key, required this.block});
  final QuizBlock block;

  @override
  State<QuizBlockWidget> createState() => _QuizBlockWidgetState();
}

class _QuizBlockWidgetState extends State<QuizBlockWidget> {
  var _selected = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
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
                RadioGroup<int>(
                  groupValue: _selected,
                  onChanged: (v) => setState(() => _selected = v ?? -1),
                  child: Column(
                    children: widget.block.choices
                        .asMap()
                        .entries
                        .map(
                          (e) => RadioListTile<int>(
                            value: e.key,
                            title: Text(e.value),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     if (_currentBlockIndex > 0)
            //       TextButton(
            //         onPressed: () {
            //           setState(() => _currentBlockIndex--);
            //         },
            //         child: const Text('Назад'),
            //       )
            //     else
            //       const SizedBox(width: 80),

            //     FilledButton(
            //       onPressed: () {
            //         if (currentBlock.correctChoiceIndices.contains(_selected)) {
            //           setState(() => _currentBlockIndex++);
            //         } else {
            //           print("Неправильно!");
            //           return;
            //         }

            //         if (!(_currentBlockIndex ==
            //             widget.lesson.blocks.length - 1)) {
            //           setState(() => _currentBlockIndex++);
            //         } else {
            //           Navigator.pop(context, true);
            //         }
            //       },
            //       child: Text(
            //         _currentBlockIndex == widget.lesson.blocks.length - 1
            //             ? 'Завершить'
            //             : 'Далее',
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
