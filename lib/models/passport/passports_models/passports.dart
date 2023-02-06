import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';
import 'package:satefy_cage/models/passport/passport_model/passport.dart';
import 'package:satefy_cage/models/question/question_model.dart';
import 'package:satefy_cage/models/work/work_model.dart';

part 'passports.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Passports extends HiveObject {
  Passports({
    this.passports,
    this.hurdles,
    this.work,
    this.questions,
  });

  @HiveField(0)
  List<Passport>? passports;
  @HiveField(1)
  List<Hurdle>? hurdles;
  @HiveField(2)
  List<Work>? work;
  @HiveField(3)
  List<Question>? questions;

  /// Метод получения объекта из  JSON [_$PassportsFromJson]
  factory Passports.fromJson(Map<String, dynamic> json) =>
      _$PassportsFromJson(json);

  /// Метод преобразования объекта из  JSON [_$PassportFromJson]
  Map<String, dynamic> toJson() => _$PassportsToJson(this);
}
