import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovation_project/core/config/theme/dark_colors.dart';
import 'package:innovation_project/core/config/theme/light_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: _getMaterialColor(
      AppLightColors.primaryColor,
    ),
    primaryColor: AppLightColors.primaryColor,
    scaffoldBackgroundColor: AppLightColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: _getMaterialColor(
      AppDarkColors.primaryColor,
    ),
    primaryColor: AppLightColors.primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppDarkColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
  const AppTheme._();

  static MaterialColor _getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    final int alpha = color.alpha;

    final Map<int, Color> shades = {
      50: Color.fromARGB(alpha, red, green, blue),
      100: Color.fromARGB(alpha, red, green, blue),
      200: Color.fromARGB(alpha, red, green, blue),
      300: Color.fromARGB(alpha, red, green, blue),
      400: Color.fromARGB(alpha, red, green, blue),
      500: Color.fromARGB(alpha, red, green, blue),
      600: Color.fromARGB(alpha, red, green, blue),
      700: Color.fromARGB(alpha, red, green, blue),
      800: Color.fromARGB(alpha, red, green, blue),
      900: Color.fromARGB(alpha, red, green, blue),
    };

    return MaterialColor(color.value, shades);
  }
}
