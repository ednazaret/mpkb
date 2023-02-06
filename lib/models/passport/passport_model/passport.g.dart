// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passport.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassportAdapter extends TypeAdapter<Passport> {
  @override
  final int typeId = 3;

  @override
  Passport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Passport(
      passport_id: fields[0] as String?,
      passport_name: fields[1] as String?,
      hurdle: (fields[2] as List?)?.cast<Hurdle>(),
    );
  }

  @override
  void write(BinaryWriter writer, Passport obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.passport_id)
      ..writeByte(1)
      ..write(obj.passport_name)
      ..writeByte(2)
      ..write(obj.hurdle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passport _$PassportFromJson(Map<String, dynamic> json) => Passport(
      passport_id: json['passport_id'] as String?,
      passport_name: json['passport_name'] as String?,
      hurdle: (json['hurdle'] as List<dynamic>?)
          ?.map((e) => Hurdle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PassportToJson(Passport instance) => <String, dynamic>{
      'passport_id': instance.passport_id,
      'passport_name': instance.passport_name,
      'hurdle': instance.hurdle,
    };
