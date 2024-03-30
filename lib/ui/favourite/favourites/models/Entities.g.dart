// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntitiesAdapter extends TypeAdapter<Entities> {
  @override
  final int typeId = 0;

  @override
  Entities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entities(
      id: fields[0] as int?,
      name: fields[1] as String?,
      link: fields[2] as String?,
      logo: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Entities obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
