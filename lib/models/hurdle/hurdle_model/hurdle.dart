// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hurdle.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Hurdle extends HiveObject {
  Hurdle({
    this.hurdle_id,
    this.hurdle_name,
    this.myb,
    this.picture,
    this.work,
    this.video,
  });

  @HiveField(0)
  String? hurdle_id;
  @HiveField(1)
  String? hurdle_name;
  @HiveField(2)
  String? video;
  @HiveField(3)
  String? picture;
  @HiveField(4)
  List<String>? myb;
  @HiveField(5)
  List<String>? work;
  @HiveField(6)
  String? screen;

  /// Метод получения объекта из  JSON [_$HurdleFromJson]
  factory Hurdle.fromJson(Map<String, dynamic> json) => _$HurdleFromJson(json);

  /// Метод преобразования объекта из  JSON [_$HurdleFromJson]
  Map<String, dynamic> toJson() => _$HurdleToJson(this);
}
