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
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _currentBlockIndex / (widget.lesson.blocks.length - 1),
          ),
          Expanded(
            child: _buildBlockWidget(widget.lesson.blocks[_currentBlockIndex]),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    final bool isLast = _currentBlockIndex == widget.lesson.blocks.length - 1;
    final bool hasPrevious = _currentBlockIndex > 0;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Используем прозрачную заглушку, чтобы "Далее" всегда была справа
            if (hasPrevious)
              TextButton(
                onPressed: () => setState(() => _currentBlockIndex--),
                child: const Text('Назад'),
              )
            else
              const SizedBox(
                width: 80,
              ), // Примерная ширина кнопки, чтобы не ломать Row

            FilledButton(
              onPressed: () {
                if (!isLast) {
                  setState(() => _currentBlockIndex++);
                } else {
                  Navigator.pop(context, true);
                }
              },
              child: Text(isLast ? 'Завершить' : 'Далее'),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBlockWidget(Block currentBlock) {
    setState(() {
          currentBlock.complete();
    });
    if (currentBlock.type == BlockType.theory)
    {
      return _buildBlockTheoryWidget(currentBlock);
    }
    return Column(
      children: [
        Text(currentBlock.title),
        Text(currentBlock.type.name)
      ],
    );
  }
  
  Widget _buildBlockTheoryWidget(Block currentBlock) {
    TheoryBlock block = currentBlock as TheoryBlock;
    return ListView(
      children: [
        ListTile(title: Text(block.title), subtitle: Text(block.content),)
      ],
    );
  }
}
