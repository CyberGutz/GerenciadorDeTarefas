import 'dart:math';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color _lightPrimary = Color.fromARGB(255, 211, 211, 211);
  static const Color _lightSecondary = Color.fromARGB(255, 182, 182, 182);
  static Color _lightTertiary = Colors.teal;
  static const Color _lightOnPrimary = Colors.black;
  static const Color _lightOnSecondary = Colors.black;
  static const Color _lightOnTertiary = Colors.black;
  static const Color _lightBackground = Colors.white;
  static const Color _lightOnBackground = Colors.black;

  static const Color _darkPrimary = Colors.black;
  static const Color _darkSecondary = Color.fromRGBO(33, 33, 33, 1);
  static Color _darkTertiary = Color.fromRGBO(255, 160, 0, 1);
  static const Color _darkOnPrimary = Colors.white;
  static const Color _darkOnSecondary = Colors.white;
  static const Color _darkOnTertiary = Colors.black;
  static const Color _darkBackground = Colors.black;
  static const Color _darkOnBackground = Colors.white;

  static const Color _disabled = Colors.blueGrey;
  static const Color _error = Colors.red;

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: _lightOnPrimary,
        fontFamily: "Roboto",
        fontSize: 26.0,
      ),
      color: Colors.transparent,
      iconTheme: IconThemeData(
        size: 20.0,
        color: _lightOnPrimary,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      background: _lightBackground,
      error: _error,
      errorContainer: _error,
      inversePrimary: Colors.black,
      inverseSurface: const Color.fromARGB(255, 182, 182, 182),
      onBackground: _lightOnBackground,
      onError: Colors.black,
      onErrorContainer: Colors.black,
      onInverseSurface: Colors.black,
      onPrimary: _lightOnPrimary,
      onPrimaryContainer: _lightOnPrimary,
      onSecondary: _lightOnSecondary,
      onSecondaryContainer: _lightOnSecondary,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.grey,
      onTertiary: _lightOnTertiary,
      onTertiaryContainer: _lightOnTertiary,
      outline: Colors.black,
      outlineVariant: Colors.teal,
      primary: _lightPrimary,
      primaryContainer: Colors.white,
      secondary: _lightSecondary,
      secondaryContainer: Colors.grey.shade800,
      surface: Colors.white,
      tertiary: _lightTertiary,
      tertiaryContainer: Colors.teal,
      shadow: const Color.fromARGB(77, 73, 73, 73),
      surfaceVariant: Colors.grey.shade900,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) => Colors.black),
      trackColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
    checkboxTheme: CheckboxThemeData(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.black)),
    iconTheme: const IconThemeData(
      size: 20,
      color: Colors.black,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 57.0,
        wordSpacing: 0,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 45.0,
        wordSpacing: 0,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 36.0,
        wordSpacing: 0,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 32.0,
        wordSpacing: 0,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 28.0,
        wordSpacing: 0,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 24.0,
        wordSpacing: 0,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 22.0,
        wordSpacing: 0,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 16.0,
        wordSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 16.0,
        wordSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 16.0,
        wordSpacing: 0.15,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 14.0,
        wordSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 12.0,
        wordSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 14.0,
        wordSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 12.0,
        wordSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 11.0,
        wordSpacing: 0.5,
      ),
    ),
    disabledColor: const Color.fromARGB(255, 93, 108, 115),
    dividerTheme: const DividerThemeData(
      color: Colors.black,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: _lightBackground,
    ),
    cardTheme: const CardTheme(
      color: _lightSecondary,
    ),
    hintColor: _disabled,
    platform: TargetPlatform.android,
    scaffoldBackgroundColor: _lightBackground,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 26.0,
      ),
      color: Colors.transparent,
      iconTheme: IconThemeData(
        size: 20.0,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: _darkBackground,
      error: _error,
      errorContainer: _error,
      inversePrimary: Colors.white,
      inverseSurface: const Color.fromARGB(255, 182, 182, 182),
      onBackground: _darkOnBackground,
      onError: Colors.black,
      onErrorContainer: Colors.black,
      onInverseSurface: Colors.black,
      onPrimary: _darkOnPrimary,
      onPrimaryContainer: _darkOnPrimary,
      onSecondary: _darkOnSecondary,
      onSecondaryContainer: _darkOnSecondary,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.grey,
      onTertiary: _darkOnTertiary,
      onTertiaryContainer: _darkOnTertiary,
      outline: Colors.white,
      outlineVariant: Colors.amber,
      primary: _darkPrimary,
      primaryContainer: Colors.black87,
      secondary: _darkSecondary,
      secondaryContainer: Colors.grey.shade800,
      surface: Colors.black,
      tertiary: _darkTertiary,
      tertiaryContainer: Colors.amber,
      shadow: Colors.white30,
      surfaceVariant: Colors.grey.shade900,
    ),
    iconTheme: const IconThemeData(
      size: 20,
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 57.0,
        wordSpacing: 0,
      ),
      displayMedium: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 45.0,
        wordSpacing: 0,
      ),
      displaySmall: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 36.0,
        wordSpacing: 0,
      ),
      headlineLarge: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 32.0,
        wordSpacing: 0,
      ),
      headlineMedium: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 28.0,
        wordSpacing: 0,
      ),
      headlineSmall: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 24.0,
        wordSpacing: 0,
      ),
      titleLarge: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 22.0,
        wordSpacing: 0,
      ),
      titleMedium: TextStyle(
        color: _darkOnPrimary,
        fontFamily: "Roboto",
        fontSize: 16.0,
        wordSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 16.0,
        wordSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 16.0,
        wordSpacing: 0.15,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 14.0,
        wordSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 12.0,
        wordSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 14.0,
        wordSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 12.0,
        wordSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 11.0,
        wordSpacing: 0.5,
      ),
    ),
    disabledColor: const Color.fromARGB(255, 93, 108, 115),
    dividerTheme: const DividerThemeData(
      color: Color.fromRGBO(141, 141, 141, 1),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromRGBO(17, 17, 17, 1),
    ),
    cardTheme: CardTheme(
      color: Colors.grey.shade800,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) => Colors.black),
      trackColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
    hintColor: const Color.fromARGB(255, 216, 216, 216),
    platform: TargetPlatform.android,
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
  );

  static void setAccentColor(bool flag, Color color) {
    if (flag == true) {
      _darkTertiary = color;
    } else {
      _lightTertiary = color;
    }
  }

  Color getPrimary(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color getSecondary(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color getTertiary(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color getOnPrimary(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color getOnSecondary(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color getOnTertiary(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color getDisabled(bool flag) {
    if (flag == true) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
