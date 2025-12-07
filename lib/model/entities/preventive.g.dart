// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preventive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PreventiveAdapter extends TypeAdapter<Preventive> {
  @override
  final int typeId = 0;

  @override
  Preventive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Preventive(
      setor: fields[0] as String,
      codigo: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Preventive obj) {
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
      other is PreventiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
