import 'package:flutter/material.dart';

/// Тема для приложения
abstract class ThemeDataProject {
  static ThemeData get black => _initThemeLight();

  static ThemeData _initThemeLight() {
    return ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        )
    );
  }
}
