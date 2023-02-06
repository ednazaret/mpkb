// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part "question_model.g.dart";

@JsonSerializable()
@HiveType(typeId: 17)
class Question extends HiveObject {
  Question({
    this.question_id,
    this.question_name,
    this.media,
  });

  @HiveField(0)
  final String? question_id;
  @HiveField(1)
  final String? question_name;
  @HiveField(2)
  final String? media;

  /// Метод получения объекта из  JSON [_$QuestionFromJson]
  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  /// Метод преобразования объекта из  JSON [_$PassportFromJson]
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

//{
//       "question_id": "АВИА.01.1.1.",
//       "media": "Ссылка2.АВИА.01.1.1.",
//       "question_name": "В подразделении ДО, организующем авиационные перевозки, имеется в наличии «Реестр летного состава, допущенного к перевозкам в интересах Компании», утвержденный уполномоченным ПАО «Газпром нефть» подразделением, курирующим авиационные перевозки в Компании"
//     },
