import 'package:flutter/material.dart';
import 'package:satefy_cage/utils/colors/colors.dart';

abstract class AppTheme {
  static ThemeData main = ThemeData(
      primaryColor: AppColors.paleBlue,
      primarySwatch: MaterialColor(0x000000000, {
        50: AppColors.paleBlue.withOpacity(0.1), //10%
        100: AppColors.paleBlue.withOpacity(0.2), //20%
        200: AppColors.paleBlue.withOpacity(0.3), //30%
        300: AppColors.paleBlue.withOpacity(0.4), //40%
        400: AppColors.paleBlue.withOpacity(0.5), //50%
        500: AppColors.paleBlue.withOpacity(0.6), //60%
        600: AppColors.paleBlue.withOpacity(0.7), //70%
        700: AppColors.paleBlue.withOpacity(0.8), //80%
        800: AppColors.paleBlue.withOpacity(0.9), //90%
        900: AppColors.paleBlue.withOpacity(1), //100%
      }),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      dividerColor: Colors.transparent,
      expansionTileTheme: const ExpansionTileThemeData(
        textColor: AppColors.mainText,
        backgroundColor: AppColors.paleBlueLight,
        collapsedBackgroundColor: AppColors.paleBlueLight,
        childrenPadding: EdgeInsets.zero,
      ));
}
