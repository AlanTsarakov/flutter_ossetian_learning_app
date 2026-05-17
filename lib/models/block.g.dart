// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlockAdapter extends TypeAdapter<Block> {
  @override
  final int typeId = 4;

  @override
  Block read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Block(
      title: fields[0] as String,
      type: fields[1] as BlockType,
      isCompleted: fields[2] as bool,
      contentType: fields[3] as ContentType?,
      content: fields[4] as String?,
      choices: (fields[5] as List?)?.cast<String>(),
      correctChoiceIndices: (fields[6] as List?)?.cast<int>(),
      allowMultiple: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Block obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.contentType)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.choices)
      ..writeByte(6)
      ..write(obj.correctChoiceIndices)
      ..writeByte(7)
      ..write(obj.allowMultiple);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BlockTypeAdapter extends TypeAdapter<BlockType> {
  @override
  final int typeId = 2;

  @override
  BlockType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BlockType.theory;
      case 1:
        return BlockType.quiz;
      case 2:
        return BlockType.trueFalse;
      case 3:
        return BlockType.textInput;
      case 4:
        return BlockType.fillBlanks;
      case 5:
        return BlockType.matching;
      default:
        return BlockType.theory;
    }
  }

  @override
  void write(BinaryWriter writer, BlockType obj) {
    switch (obj) {
      case BlockType.theory:
        writer.writeByte(0);
        break;
      case BlockType.quiz:
        writer.writeByte(1);
        break;
      case BlockType.trueFalse:
        writer.writeByte(2);
        break;
      case BlockType.textInput:
        writer.writeByte(3);
        break;
      case BlockType.fillBlanks:
        writer.writeByte(4);
        break;
      case BlockType.matching:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlockTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContentTypeAdapter extends TypeAdapter<ContentType> {
  @override
  final int typeId = 3;

  @override
  ContentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ContentType.text;
      default:
        return ContentType.text;
    }
  }

  @override
  void write(BinaryWriter writer, ContentType obj) {
    switch (obj) {
      case ContentType.text:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
