import 'package:flutter_ossetian_learning_app/models/block.dart';
import 'package:hive/hive.dart';


part 'lesson.g.dart';

@HiveType(typeId: 1)
class Lesson {
  @HiveField(0)
  final int? id;
    @HiveField(1)
  final String title;
    @HiveField(2)
  final String description;
    @HiveField(3)
  final List<Block> blocks;

  bool get isCompleted =>
      blocks.length == blocks.where((block) => block.isCompleted).length;
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

