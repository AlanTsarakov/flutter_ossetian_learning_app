import 'package:hive_flutter/hive_flutter.dart';

part 'block.g.dart';

@HiveType(typeId: 2)
enum BlockType {
  @HiveField(0)
  theory,
  @HiveField(1)
  quiz,
  @HiveField(2)
  trueFalse,
  @HiveField(3)
  textInput,
  @HiveField(4)
  fillBlanks,
  @HiveField(5)
  matching,
  @HiveField(6)
  flashcard,
}

@HiveType(typeId: 3)
enum ContentType {
  @HiveField(0)
  text,
}

@HiveType(typeId: 4)
class Block {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final BlockType type;

  @HiveField(2)
  bool isCompleted;

  // Поля для теории (nullable)
  @HiveField(3)
  final ContentType? contentType;

  @HiveField(4)
  final String? content;

  // Поля для теста (nullable)
  @HiveField(5)
  final List<String>? choices;

  @HiveField(6)
  final List<int>? correctChoiceIndices;

  @HiveField(7)
  final bool? allowMultiple;

  // Поля для карточки

  @HiveField(8)
  final String? front;

  @HiveField(9)
  final String? back;

  // Главный конструктор делаем приватным, чтобы создавать объекты только через фабрики
  Block({
    required this.title,
    required this.type,
    this.isCompleted = false,
    this.contentType,
    this.content,
    this.choices,
    this.correctChoiceIndices,
    this.allowMultiple,
    this.back,
    this.front,
  });

  // Фабрика для создания теории
  factory Block.theory({
    required String title,
    required ContentType contentType,
    required String content,
    bool isCompleted = false,
  }) {
    return Block(
      title: title,
      type: BlockType.theory,
      isCompleted: isCompleted,
      contentType: contentType,
      content: content,
    );
  }

  // Фабрика для создания квиза
  factory Block.quiz({
    required String title,
    required List<String> choices,
    required List<int> correctChoiceIndices,
    bool allowMultiple = true,
    bool isCompleted = false,
  }) {
    return Block(
      title: title,
      type: BlockType.quiz,
      isCompleted: isCompleted,
      choices: choices,
      correctChoiceIndices: correctChoiceIndices,
      allowMultiple: allowMultiple,
    );
  }

  // Фабрика для создания теории
  factory Block.flashcard({
    required String title,
    required String front,
    required String back,
    bool isCompleted = false,
  }) {
    return Block(
      title: title,
      type: BlockType.flashcard,
      front: front,
      back: back,
      isCompleted: isCompleted,
    );
  }

  void complete() {
    isCompleted = true;
  }
}

// // 3. ПРАВДА / ЛОЖЬ
// class TrueFalseBlock extends Block {
//   final bool correctAnswer;

//   TrueFalseBlock({super.id, required super.title, required this.correctAnswer})
//     : super(type: BlockType.trueFalse);
// }

// // 4. ВВОД ТЕКСТА
// class TextInputBlock extends Block {
//   final String correctAnswer;
//   final bool caseSensitive;

//   TextInputBlock({
//     super.id,
//     required super.title,
//     required this.correctAnswer,
//     this.caseSensitive = false,
//   }) : super(type: BlockType.textInput);
// }

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