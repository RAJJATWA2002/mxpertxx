import 'package:flutter/material.dart';
import 'colors.dart';

class MThemeData {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: "Poppins",
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(color: backgroundColor),
    );
  }
}
