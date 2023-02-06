import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';
import 'package:satefy_cage/models/passport/passports_models/passports.dart';

///Класс для работы с Данными
abstract class KBData {
  static Future<void> getPassports() async {
    final passes = Hive.box<Passports>('passports');
    final String fileData = await rootBundle.loadString('assets/json/all.json');
    final Map<String, dynamic> fileMap = jsonDecode(fileData);
    if (passes.isEmpty == true) {
      await passes.put('passports', Passports.fromJson(fileMap));
    } else {
      if (passes.isNotEmpty == true) {
        await passes.put('passports', Passports.fromJson(fileMap));
      }
    }
    final favoritesBox = Hive.box<Favorites>('favorites');
    if (favoritesBox.isEmpty == true) {
      await favoritesBox.put('favorites', Favorites(favoriteHurdles: []));
    }
  }
}
