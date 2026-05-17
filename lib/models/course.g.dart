// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 0;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course(
      id: fields[0] as int?,
      urlPhoto: fields[7] as String,
      name: fields[3] as String,
      description: fields[4] as String,
      rating: fields[5] as double,
      author: fields[6] as String,
      category: fields[8] as String,
      version: fields[12] as int,
      lessons: (fields[9] as List).cast<Lesson>(),
    )
      ..isStarted = fields[1] as bool
      ..isCompleted = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isStarted)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.rating)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.urlPhoto)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.lessons)
      ..writeByte(12)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
