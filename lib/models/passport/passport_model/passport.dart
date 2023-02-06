// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';

part "passport.g.dart";

@JsonSerializable()
@HiveType(typeId: 3)
class Passport extends HiveObject {
  Passport({
    this.passport_id,
    this.passport_name,
    this.hurdle,
  });

  @HiveField(0)
  String? passport_id;
  @HiveField(1)
  String? passport_name;
  @HiveField(2)
  List<Hurdle>? hurdle;

  ///Сворачивает все [Hurdle] и [Passport] в JSON
  Map<String, dynamic> dataToJson() {
    return {
      "passport_id": passport_id,
      "passport_name": passport_name,
      "hurdle": [for (final hur in (hurdle ?? [])) hur.toJson()],
    };
  }

  /// Метод получения объекта из  JSON [_$PassportFromJson]
  factory Passport.fromJson(Map<String, dynamic> json) =>
      _$PassportFromJson(json);

  /// Метод преобразования объекта из  JSON [_$PassportFromJson]
  Map<String, dynamic> toJson() => _$PassportToJson(this);
}
