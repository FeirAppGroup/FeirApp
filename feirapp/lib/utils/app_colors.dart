import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static const Color textStyle = Color(0xFF000000);

  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF9E9E9E);

  static const Color primaryColor = Color(0xFF01B763);
  static const Color primaryColorLight = Color(0x7C01B762);

  static const Color secondaryColor = Color(0xFFFF0000);

  static const Color formGrey = Color(0xFF9E9E9E);

  static const Color backgroundIconColor = Color(0xFFEBFAF3);

  static const Color shadowColor = Color(0xFFD3D3D3);

  static const Color fieldBackground = Color(0xFFE6EBED);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006D39),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF6DFDA0),
    onPrimaryContainer: Color(0xFF00210D),
    secondary: Color(0xFF506353),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD2E8D3),
    onSecondaryContainer: Color(0xFF0D1F12),
    tertiary: Color(0xFF3A656F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBEEAF6),
    onTertiaryContainer: Color(0xFF001F25),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFDF7),
    onBackground: Color(0xFF191C19),
    surface: Color(0xFFFBFDF7),
    onSurface: Color(0xFF191C19),
    surfaceVariant: Color(0xFFDDE5DB),
    onSurfaceVariant: Color(0xFF414941),
    outline: Color(0xFF717971),
    onInverseSurface: Color(0xFFF0F1EC),
    inverseSurface: Color(0xFF2E312E),
    inversePrimary: Color(0xFF4DE087),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006D39),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF4DE087),
    onPrimary: Color(0xFF00391B),
    primaryContainer: Color(0xFF005229),
    onPrimaryContainer: Color(0xFF6DFDA0),
    secondary: Color(0xFFB6CCB8),
    onSecondary: Color(0xFF223526),
    secondaryContainer: Color(0xFF384B3C),
    onSecondaryContainer: Color(0xFFD2E8D3),
    tertiary: Color(0xFFA2CED9),
    onTertiary: Color(0xFF01363F),
    tertiaryContainer: Color(0xFF204D56),
    onTertiaryContainer: Color(0xFFBEEAF6),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C19),
    onBackground: Color(0xFFE1E3DE),
    surface: Color(0xFF191C19),
    onSurface: Color(0xFFE1E3DE),
    surfaceVariant: Color(0xFF414941),
    onSurfaceVariant: Color(0xFFC1C9BF),
    outline: Color(0xFF8B938A),
    onInverseSurface: Color(0xFF191C19),
    inverseSurface: Color(0xFFE1E3DE),
    inversePrimary: Color(0xFF006D39),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4DE087),
  );
}
