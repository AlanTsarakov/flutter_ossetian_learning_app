class Lesson {
  final int? id;
  final String title;
  final String description;
  final List<Block> blocks;




  bool get isCompleted => blocks.length == blocks.where((block) => block.isCompleted).length;
  // int durationInMinutes;

  int get totalBlocks => blocks.length;
  int get completedBlocks => blocks.where((b) => b.isCompleted).length;
  double get progress => totalBlocks == 0 ? 1 : completedBlocks / totalBlocks;
  bool get isAllBlocksCompleted => completedBlocks == totalBlocks;

  Lesson({
    this.id,
    required this.title,
    this.description = '',
    this.blocks = const [],
    // this.durationInMinutes = 0,
  });

}

abstract class Block {
  final int? id;
  final String title;
  final BlockType type;
  bool isCompleted;

  void complete()
  {
    isCompleted = true;
  }

  Block({
    this.id,
    required this.title,
    required this.type,
    this.isCompleted = false,
  });
}

enum BlockType {
  theory, // теория (текст/видео)
  quiz, // тест (выбор ответа)
  trueFalse, // правда/ложь
  textInput, // ввод текста
  fillBlanks, // заполнить пропуски
  matching, // сопоставить пары
}

class TheoryBlock extends Block {
  final ContentType contentType;
  final String content;

  TheoryBlock({
    super.id,
    required super.title,
    required this.contentType,
    required this.content,
  }) : super(type: BlockType.theory);
}

enum ContentType { text }

class QuizBlock extends Block {
  final List<String> choices;
  final List<int> correctChoiceIndices;
  final bool allowMultiple;

  QuizBlock({
    super.id,
    required super.title,
    required this.choices,
    required this.correctChoiceIndices,
    this.allowMultiple = false,
  }) : super(type: BlockType.quiz);
}

// 3. ПРАВДА / ЛОЖЬ
class TrueFalseBlock extends Block {
  final bool correctAnswer;

  TrueFalseBlock({super.id, required super.title, required this.correctAnswer})
    : super(type: BlockType.trueFalse);
}

// 4. ВВОД ТЕКСТА
class TextInputBlock extends Block {
  final String correctAnswer;
  final bool caseSensitive;

  TextInputBlock({
    super.id,
    required super.title,
    required this.correctAnswer,
    this.caseSensitive = false,
  }) : super(type: BlockType.textInput);
}

// // 5. ЗАПОЛНИТЬ ПРОПУСКИ
// class FillBlanksBlock extends Block {
//   final String text;                 // Текст с пропусками: "Dart — язык от ___"
//   final List<String> correctAnswers;
  
//   FillBlanksBlock({
//     super.id,
//     required super.title,
//     required this.text,
//     required this.correctAnswers,
//   }) : super(type: BlockType.fillBlanks);
// }

// // 6. СОПОСТАВИТЬ ПАРЫ
// class MatchingBlock extends Block {
//   final Map<String, String> pairs;  // лево → право
  
//   MatchingBlock({
//     super.id,
//     required super.title,
//     required this.pairs,
//   }) : super(type: BlockType.matching);
// }