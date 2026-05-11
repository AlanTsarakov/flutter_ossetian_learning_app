import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class TheoryBlockWidget extends StatefulWidget {
  const TheoryBlockWidget({super.key, required this.block});
  final TheoryBlock block;

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
        // Кнопки навигации
        // _buildNavigationButtons(),
      ],
    );
  }
  //   Widget _buildNavigationButtons() {
  //   final bool isLast = _currentBlockIndex == widget.lesson.blocks.length - 1;
  //   final bool hasPrevious = _currentBlockIndex > 0;

  //   return SafeArea(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           if (hasPrevious)
  //             TextButton(
  //               onPressed: () => setState(() => _currentBlockIndex--),
  //               child: const Text('Назад'),
  //             )
  //           else
  //             const SizedBox(width: 80),

  //           FilledButton(
  //             onPressed: () {
  //               if (!isLast) {
  //                 setState(() => _currentBlockIndex++);
  //               } else {
  //                 Navigator.pop(context, true);
  //               }
  //             },
  //             child: Text(isLast ? 'Завершить' : 'Далее'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
