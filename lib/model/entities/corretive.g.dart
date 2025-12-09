// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corrective.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CorretiveAdapter extends TypeAdapter<Corretive> {
  @override
  final int typeId = 1;

  @override
  Corretive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Corretive(
      setor: fields[0] as String,
      codigo: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Corretive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.setor)
      ..writeByte(1)
      ..write(obj.codigo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorretiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
