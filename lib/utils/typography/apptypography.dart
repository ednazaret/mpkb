import 'package:flutter/material.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

///Типографика приложения
///Стили текста на базе SFPro Display
abstract class AppTypography {
  const AppTypography._();

  ///Главный текстовый стиль приложения.
  ///Для внесения собственных корректировок следует использовать
  ///copyWith() метод
  static const TextStyle regularStyle = TextStyle(
    fontFamily: 'Sfpro',
    color: AppColors.white,
  );
  static const TextStyle mediumStyle = TextStyle(
    fontFamily: 'SfproMed',
    color: AppColors.white,
  );
  static const TextStyle boldStyle = TextStyle(
    fontFamily: 'SfproBold',
    color: AppColors.white,
  );
  static const TextStyle semiboldStyle = TextStyle(
    fontFamily: 'SfproSemi',
    color: AppColors.white,
  );
}
