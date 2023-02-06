// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hurdle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HurdleAdapter extends TypeAdapter<Hurdle> {
  @override
  final int typeId = 1;

  @override
  Hurdle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hurdle(
      hurdle_id: fields[0] as String?,
      hurdle_name: fields[1] as String?,
      myb: (fields[4] as List?)?.cast<String>(),
      picture: fields[3] as String?,
      work: (fields[5] as List?)?.cast<String>(),
      video: fields[2] as String?,
    )..screen = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, Hurdle obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.hurdle_id)
      ..writeByte(1)
      ..write(obj.hurdle_name)
      ..writeByte(2)
      ..write(obj.video)
      ..writeByte(3)
      ..write(obj.picture)
      ..writeByte(4)
      ..write(obj.myb)
      ..writeByte(5)
      ..write(obj.work)
      ..writeByte(6)
      ..write(obj.screen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HurdleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hurdle _$HurdleFromJson(Map<String, dynamic> json) => Hurdle(
      hurdle_id: json['hurdle_id'] as String?,
      hurdle_name: json['hurdle_name'] as String?,
      myb: (json['myb'] as List<dynamic>?)?.map((e) => e as String).toList(),
      picture: json['picture'] as String?,
      work: (json['work'] as List<dynamic>?)?.map((e) => e as String).toList(),
      video: json['video'] as String?,
    )..screen = json['screen'] as String?;

Map<String, dynamic> _$HurdleToJson(Hurdle instance) => <String, dynamic>{
      'hurdle_id': instance.hurdle_id,
      'hurdle_name': instance.hurdle_name,
      'video': instance.video,
      'picture': instance.picture,
      'myb': instance.myb,
      'work': instance.work,
      'screen': instance.screen,
    };
