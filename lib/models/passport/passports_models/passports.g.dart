// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passports.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassportsAdapter extends TypeAdapter<Passports> {
  @override
  final int typeId = 4;

  @override
  Passports read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Passports(
      passports: (fields[0] as List?)?.cast<Passport>(),
      hurdles: (fields[1] as List?)?.cast<Hurdle>(),
      work: (fields[2] as List?)?.cast<Work>(),
      questions: (fields[3] as List?)?.cast<Question>(),
    );
  }

  @override
  void write(BinaryWriter writer, Passports obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.passports)
      ..writeByte(1)
      ..write(obj.hurdles)
      ..writeByte(2)
      ..write(obj.work)
      ..writeByte(3)
      ..write(obj.questions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassportsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passports _$PassportsFromJson(Map<String, dynamic> json) => Passports(
      passports: (json['passports'] as List<dynamic>?)
          ?.map((e) => Passport.fromJson(e as Map<String, dynamic>))
          .toList(),
      hurdles: (json['hurdles'] as List<dynamic>?)
          ?.map((e) => Hurdle.fromJson(e as Map<String, dynamic>))
          .toList(),
      work: (json['work'] as List<dynamic>?)
          ?.map((e) => Work.fromJson(e as Map<String, dynamic>))
          .toList(),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PassportsToJson(Passports instance) => <String, dynamic>{
      'passports': instance.passports,
      'hurdles': instance.hurdles,
      'work': instance.work,
      'questions': instance.questions,
    };
