// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hurdles.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HurdlesAdapter extends TypeAdapter<Hurdles> {
  @override
  final int typeId = 2;

  @override
  Hurdles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hurdles(
      hurdles: (fields[0] as List?)?.cast<Hurdle>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hurdles obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.hurdles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HurdlesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hurdles _$HurdlesFromJson(Map<String, dynamic> json) => Hurdles(
      hurdles: (json['hurdles'] as List<dynamic>?)
          ?.map((e) => Hurdle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HurdlesToJson(Hurdles instance) => <String, dynamic>{
      'hurdles': instance.hurdles,
    };
