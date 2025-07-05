import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1894CD);

  static ThemeData light() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Cairo',
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Brightness.dark,  
          statusBarBrightness: Brightness.dark,
        ),
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark();
    return base.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: base.textTheme.apply(fontFamily: 'Cairo'),
      primaryTextTheme: base.primaryTextTheme.apply(fontFamily: 'Cairo'),
      appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
    );
  }
}
