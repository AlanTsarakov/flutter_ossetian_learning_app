import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/lesson/widgets/quiz_block_widget.dart';
import 'package:flutter_ossetian_learning_app/features/lesson/widgets/theory_block_widget.dart';
import 'package:flutter_ossetian_learning_app/models/block.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({
    super.key,
    required this.lesson,
    required this.onLessonComplete,
  });
  final Lesson lesson;
  final VoidCallback onLessonComplete;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentBlockIndex = 0;
  final Map<int, List<String>> quizAsnwers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(
              begin: 0,
              end: _currentBlockIndex / (widget.lesson.blocks.length - 1),
            ),
            duration: Duration(milliseconds: 500), // плавность 0.5 секунды
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return LinearProgressIndicator(value: value);
            },
          ),
          Expanded(
            child: _buildBlockWidget(widget.lesson.blocks[_currentBlockIndex]),
          ),
        ],
      ),
    );
  }

  Widget _buildBlockWidget(Block currentBlock) {
    switch (currentBlock.type) {
      case (BlockType.theory):
        return TheoryBlockWidget(
          block: currentBlock,
          onNext: _goToNextBlock,
          onPrevious: _goToPreviousBlock,
        );
      case BlockType.quiz:
        return QuizBlockWidget(
          block: currentBlock,
          onNext: _goToNextBlock,
          onPrevious: _goToPreviousBlock,
        );
      default:
        return Container();
    }
  }

  void _goToNextBlock() {
    widget.lesson.blocks[_currentBlockIndex].complete();
    if (_currentBlockIndex + 1 < widget.lesson.blocks.length) {
      setState(() => _currentBlockIndex++);
    } else {
      _showFinishDialog();
    }
  }

  void _goToPreviousBlock() {
    if (_currentBlockIndex > 0) {
      setState(() => _currentBlockIndex--);
    }
  }

  void _showFinishDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => FinishLessonDialog(
        onFinish: () {
          widget.onLessonComplete();
          Navigator.pop(context);
          Navigator.pop(dialogContext);
        },
      ),
    );
  }
}

class FinishLessonDialog extends StatelessWidget {
  final VoidCallback onFinish;
  final String? lessonTitle;

  const FinishLessonDialog({
    super.key,
    required this.onFinish,
    this.lessonTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primaryContainer,
              ),
              child: Icon(
                Icons.check_rounded,
                color: theme.colorScheme.primary,
                size: 36,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Урок завершён!',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (lessonTitle != null)
              Text(
                lessonTitle!,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 12),
            Text(
              'Отличная работа! Продолжайте в том же духе.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: onFinish,
              style: FilledButton.styleFrom(
                fixedSize: const Size(160, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Продолжить'),
            ),
          ],
        ),
      ),
    );
  }
}
