// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part "work_model.g.dart";

@JsonSerializable()
@HiveType(typeId: 24)
class Work extends HiveObject {
  Work({
    this.work_id,
    this.work_name,
    this.questions,
  });

  @HiveField(0)
  final String? work_id;
  @HiveField(1)
  final String? work_name;
  @HiveField(2)
  final List<String>? questions;

  /// Метод получения объекта из  JSON [_$WorkFromJson]
  factory Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

  /// Метод преобразования объекта из  JSON [_$PassportFromJson]
  Map<String, dynamic> toJson() => _$WorkToJson(this);
}
