// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TargetModelAdapter extends TypeAdapter<TargetModel> {
  @override
  final int typeId = 1;

  @override
  TargetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TargetModel(
      id: fields[0] as String,
      title: fields[1] as String,
      time: fields[2] as String,
      completed: fields[3] as bool,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TargetModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.completed)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TargetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
