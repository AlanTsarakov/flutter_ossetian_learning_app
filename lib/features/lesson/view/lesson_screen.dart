import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.lesson});
  final Lesson lesson;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentBlockIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentBlockIndex + 1) / widget.lesson.blocks.length,
          ),
          Expanded(
            child: Container()
            // _buildBlockWidget(currentBlock),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Кнопка НАЗАД (показываем только если не первый блок)
        if (_currentBlockIndex > 0)
          ElevatedButton(
            onPressed: () {
              setState(() {
                _currentBlockIndex--;
              });
            },
            child: const Text('Назад'),
          ),
        
        // Кнопка ДАЛЕЕ/ЗАВЕРШИТЬ (всегда показываем)
        ElevatedButton(
          onPressed: () {
            if (_currentBlockIndex < widget.lesson.blocks.length - 1) {
              setState(() {
                _currentBlockIndex++;
              });
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            _currentBlockIndex < widget.lesson.blocks.length - 1
                ? 'Далее'
                : 'Завершить',
          ),
        ),
      ],
    ),
  );
}
}