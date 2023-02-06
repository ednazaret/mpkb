import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorites_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 30)
class Favorites extends HiveObject {
  Favorites({this.favoriteHurdles});

  @HiveField(0)
  List<String>? favoriteHurdles;

  /// Метод получения объекта из  JSON [_$HurdleFromJson]
  factory Favorites.fromJson(Map<String, dynamic> json) =>
      _$FavoritesFromJson(json);

  /// Метод преобразования объекта из  JSON [_$HurdleFromJson]
  Map<String, dynamic> toJson() => _$FavoritesToJson(this);
}
