// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouritesEntityAdapter extends TypeAdapter<Favourites> {
  @override
  final int typeId = 0;

  @override
  Favourites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favourites(
      image: fields[0],
      title: fields[1],
      originalUrl: fields[2],
    );
  }

  @override
  void write(BinaryWriter writer, Favourites obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.originalUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouritesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
