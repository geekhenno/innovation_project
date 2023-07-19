import 'package:flutter/material.dart';
import 'package:innovation_project/core/config/theme/dark_colors.dart';
import 'package:innovation_project/core/config/theme/light_colors.dart';

extension TWColorsExtension on ThemeData {
  Color get primaryColor => brightness == Brightness.dark
      ? AppDarkColors.primaryColor
      : AppLightColors.primaryColor;
}
