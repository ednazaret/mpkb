import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:satefy_cage/models/hurdle/hurdle_model/hurdle.dart';

part 'hurdles.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Hurdles extends HiveObject {
  Hurdles({
    this.hurdles,
  });

  @HiveField(0)
  List<Hurdle>? hurdles;

  /// Метод получения объекта из  JSON [_$HurdlesFromJson]
  factory Hurdles.fromJson(Map<String, dynamic> json) =>
      _$HurdlesFromJson(json);

  /// Метод преобразования объекта из  JSON [_$HurdlesFromJson]
  Map<String, dynamic> toJson() => _$HurdlesToJson(this);
}
