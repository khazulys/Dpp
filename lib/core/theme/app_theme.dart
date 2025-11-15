import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class AppTheme {
  // Red & White Color Scheme
  static const Color primaryRed = Color(0xFFDC143C); // Crimson
  static const Color darkRed = Color(0xFF8B0000);
  static const Color lightRed = Color(0xFFFFE4E1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color(0xFF333333);
  static const Color mediumGray = Color(0xFF666666);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  
  // Create custom ForUI theme
  static FThemeData createLightTheme() {
    final baseTheme = FThemes.zinc.light;
    
    return baseTheme.copyWith(
      colorScheme: FColorScheme(
        brightness: Brightness.light,
        primary: primaryRed,
        primaryForeground: white,
        secondary: darkRed,
        secondaryForeground: white,
        background: lightGray,
        foreground: darkGray,
        error: error,
        errorForeground: white,
        border: Color(0xFFE0E0E0),
        hover: lightRed,
        mutedForeground: mediumGray,
        muted: Color(0xFFE8E8E8),
      ),
    );
  }
  
  static FThemeData createDarkTheme() {
    final baseTheme = FThemes.zinc.dark;
    
    return baseTheme.copyWith(
      colorScheme: FColorScheme(
        brightness: Brightness.dark,
        primary: primaryRed,
        primaryForeground: white,
        secondary: darkRed,
        secondaryForeground: white,
        background: Color(0xFF1A1A1A),
        foreground: white,
        error: error,
        errorForeground: white,
        border: Color(0xFF404040),
        hover: darkRed,
        mutedForeground: Color(0xFFB0B0B0),
        muted: Color(0xFF2A2A2A),
      ),
    );
  }
  
  // Material Theme untuk compatibility
  static ThemeData materialLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: primaryRed,
        secondary: darkRed,
        surface: white,
        error: error,
      ),
      scaffoldBackgroundColor: lightGray,
      appBarTheme: AppBarTheme(
        backgroundColor: white,
        foregroundColor: darkGray,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
  
  static ThemeData materialDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primaryRed,
        secondary: darkRed,
        surface: Color(0xFF1A1A1A),
        error: error,
      ),
      scaffoldBackgroundColor: Color(0xFF1A1A1A),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF1A1A1A),
        foregroundColor: white,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
