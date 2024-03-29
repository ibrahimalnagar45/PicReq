// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture_cat_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PicCatAdapter extends TypeAdapter<PicCat> {
  @override
  final int typeId = 0;

  @override
  PicCat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PicCat(
      image: fields[1] as String,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PicCat obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PicCatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
