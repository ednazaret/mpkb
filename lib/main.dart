import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:satefy_cage/models/favorites/favorites_model.dart';
import 'package:satefy_cage/models/question/question_model.dart';
import 'package:satefy_cage/models/work/work_model.dart';
import 'package:satefy_cage/ui/ui/initial/ui/initial_screen.dart';

import 'models/hurdle/hurdle_model/hurdle.dart';
import 'models/hurdle/hurdles_model/hurdles.dart';
import 'models/passport/passport_model/passport.dart';
import 'models/passport/passports_models/passports.dart';

///Точка входа в приложение
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  Directory directory = Directory.current;
  if (Platform.isIOS) {
    directory = await getApplicationDocumentsDirectory();
  } else {
    directory = await getApplicationDocumentsDirectory();
  }
  Hive.init(directory.path);
  Hive
    ..registerAdapter<Hurdle>(HurdleAdapter())
    ..registerAdapter<Passport>(PassportAdapter())
    ..registerAdapter<Hurdles>(HurdlesAdapter())
    ..registerAdapter<Question>(QuestionAdapter())
    ..registerAdapter<Favorites>(FavoritesAdapter())
    ..registerAdapter<Work>(WorkAdapter())
    ..registerAdapter<Passports>(PassportsAdapter());

  ///Хранит в себе дерево данных
  await Hive.openBox<Passports>('passports');

  ///Показывать на иллюстрациях диалоговое окно или нет
  await Hive.openBox<bool>('illustrationInstruction');

  ///показать онбординг или нет
  await Hive.openBox<bool>('onboardingSeen');

  ///Избранное
  await Hive.openBox<Favorites>('favorites');
  runApp(const InitialScreen());
}
