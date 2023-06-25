import 'dart:math';

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
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
      background: Colors.black,
      error: Colors.red,
      errorContainer: Colors.redAccent,
      inversePrimary: Colors.white,
      inverseSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
      onErrorContainer: Colors.black,
      onInverseSurface: Colors.black,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.white,
      onSecondary: Colors.white,
      onSecondaryContainer: Colors.white,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.grey,
      onTertiary: Colors.black,
      onTertiaryContainer: Colors.black,
      outline: Colors.white,
      outlineVariant: Colors.amber,
      primary: Colors.black,
      primaryContainer: Colors.black87,
      secondary: Colors.grey.shade900,
      secondaryContainer: Colors.grey.shade800,
      surface: Colors.black,
      tertiary: Colors.amber.shade700,
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
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 57.0,
        height: 64,
        wordSpacing: 0,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 45.0,
        height: 52,
        wordSpacing: 0,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 36.0,
        height: 44,
        wordSpacing: 0,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 32.0,
        height: 40,
        wordSpacing: 0,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 28.0,
        height: 36,
        wordSpacing: 0,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 24.0,
        height: 32,
        wordSpacing: 0,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 22.0,
        height: 28,
        wordSpacing: 0,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 16.0,
        height: 24,
        wordSpacing: 0.15,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 16.0,
        height: 20,
        wordSpacing: 0.1,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 16.0,
        height: 24,
        wordSpacing: 0.15,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 14.0,
        height: 20,
        wordSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 12.0,
        height: 16,
        wordSpacing: 0.4,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 14.0,
        height: 20,
        wordSpacing: 0.1,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 12.0,
        height: 16,
        wordSpacing: 0.5,
      ),
      labelSmall: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto",
        fontSize: 11.0,
        height: 16,
        wordSpacing: 0.5,
      ),
    ),

    // textButtonTheme: const TextButtonThemeData(

    // ),

    // textSelectionTheme: const TextSelectionThemeData(),

    // buttonTheme: const ButtonThemeData(),

    // cardTheme: const CardTheme(),

    checkboxTheme: const CheckboxThemeData(),

    disabledColor: const Color.fromARGB(255, 93, 108, 115),

    dividerTheme: const DividerThemeData(
      color: Colors.white,
    ),

    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),

    // dropdownMenuTheme: const DropdownMenuThemeData(),

    // elevatedButtonTheme: const ElevatedButtonThemeData(),

    // expansionTileTheme: const ExpansionTileThemeData(),

    // filledButtonTheme: const FilledButtonThemeData(),

    // floatingActionButtonTheme: const FloatingActionButtonThemeData(),

    hintColor: Colors.grey.shade400,

    // iconButtonTheme: const IconButtonThemeData(),

    // inputDecorationTheme: const InputDecorationTheme(),

    // listTileTheme: const ListTileThemeData(),

    // menuBarTheme: const MenuBarThemeData(),

    // menuTheme: const MenuThemeData(),

    // navigationBarTheme: const NavigationBarThemeData(),

    // navigationDrawerTheme: const NavigationDrawerThemeData(),

    platform: TargetPlatform.android,

    // popupMenuTheme: const PopupMenuThemeData(),

    // scrollbarTheme: const ScrollbarThemeData(),

    // snackBarTheme: const SnackBarThemeData(),

    // switchTheme: const SwitchThemeData(),

    // tabBarTheme: const TabBarTheme(),

    // timePickerTheme: const TimePickerThemeData(),

    // tooltipTheme: const TooltipThemeData(),

    scaffoldBackgroundColor: Colors.black,
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
      background: Colors.black,
      error: Colors.red,
      errorContainer: Colors.redAccent,
      inversePrimary: Colors.white,
      inverseSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
      onErrorContainer: Colors.black,
      onInverseSurface: Colors.black,
      onPrimary: Colors.white,
      onPrimaryContainer: Colors.white,
      onSecondary: Colors.white,
      onSecondaryContainer: Colors.white,
      onSurface: Colors.white,
      onSurfaceVariant: Colors.grey,
      onTertiary: Colors.black,
      onTertiaryContainer: Colors.black,
      outline: Colors.white,
      outlineVariant: Colors.amber,
      primary: Colors.black,
      primaryContainer: Colors.black87,
      secondary: Colors.grey.shade900,
      secondaryContainer: Colors.grey.shade800,
      surface: Colors.black,
      tertiary: Colors.amber.shade700,
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
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 57.0,
        wordSpacing: 0,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 45.0,
        wordSpacing: 0,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 36.0,
        wordSpacing: 0,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 32.0,
        wordSpacing: 0,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 28.0,
        wordSpacing: 0,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 24.0,
        wordSpacing: 0,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Roboto",
        fontSize: 22.0,
        wordSpacing: 0,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
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
    hintColor: Colors.grey.shade400,
    platform: TargetPlatform.android,
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
  );
}
