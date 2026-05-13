import 'package:flutter/material.dart';
import 'package:flutter_ossetian_learning_app/features/lesson/widgets/quiz_block_widget.dart';
import 'package:flutter_ossetian_learning_app/features/lesson/widgets/theory_block_widget.dart';
import 'package:flutter_ossetian_learning_app/models/lesson.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.lesson});
  final Lesson lesson;

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
          block: currentBlock as TheoryBlock,
          onNext: _goToNextBlock,
        );
      case BlockType.quiz:
        return QuizBlockWidget(
          block: currentBlock as QuizBlock,
          onNext: _goToNextBlock,
        );
      default:
        return Container();
    }
  }

  void _goToNextBlock() {
    if (_currentBlockIndex + 1 < widget.lesson.blocks.length) {
      setState(() => _currentBlockIndex++);
    } else {
      // _showFinishDialog();
    }
  }

  void _goToPreviousBlock() {
    setState(() => _currentBlockIndex--);
  }

  // void _showFinishDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (_) => FinishLessonDialog(
  //       completedBlocks: _completedBlocks.length,
  //       totalBlocks: widget.lesson.blocks.length,
  //       correctAnswers: _quizAnswers.values.where((a, i) => a == widget.lesson.blocks[i].correctAnswerIndex).length,
  //       onFinish: () => Navigator.pop(context),
  //     ),
  //   );
  // }
}
