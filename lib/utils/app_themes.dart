// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color _lightFocusColor = Colors.black;
  static const Color _darkFocusColor = Colors.green;

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w300;
      case 500:
        return FontWeight.w400;
      case 600:
        return FontWeight.w500;
      case 700:
        return FontWeight.w600;
      case 800:
        return FontWeight.w700;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle({
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double letterSpacing = 0.15,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: _getFontWeight(fontWeight),
      fontStyle: fontStyle,
      textStyle: GoogleFonts.montserrat(),
      letterSpacing: letterSpacing,
      color: color,
      decoration: decoration,
      height: height,
      wordSpacing: wordSpacing,
    );
  }

  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
  ) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
          color: colorScheme.background,
          actionsIconTheme: IconThemeData(color: colorScheme.onBackground),
          iconTheme: IconThemeData(color: colorScheme.onBackground),
          toolbarHeight: AppBar().preferredSize.height,
          elevation: 0),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        },
      ),
      iconTheme: IconThemeData(color: colorScheme.onSecondaryContainer),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: Colors.white,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      backgroundColor: colorScheme.background,
      bottomAppBarColor: Colors.transparent,
      bottomAppBarTheme: BottomAppBarTheme(
        color: colorScheme.background,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.primary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.background,
      ),
    );
  }

  static ColorScheme lightColorScheme = ColorScheme(
    primary: const Color(0xFF0D377F),
    onPrimary: Colors.black,
    onPrimaryContainer: const Color(0xfffafafa),
    inversePrimary: Colors.green.shade200,
    onInverseSurface: Colors.grey.shade500,
    secondary: const Color(0xFFFDF200),
    onSecondary: const Color(0xFFFFAD0B),
    secondaryContainer: Colors.red.shade300,
    onSecondaryContainer: const Color(0xff8c98a8),
    background: Colors.white,
    onBackground: const Color(0xfffafafa),
    surface: const Color(0xFFFAFBFB),
    onSurface: Colors.black26,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorScheme = const ColorScheme(
    primary: Color(0xFF0D377F),
    onPrimary: Colors.white,
    onPrimaryContainer: Color(0xFF7E818C),
    inversePrimary: Colors.green,
    secondary: Color(0xFFFDF200),
    onSecondary: Color(0xFFFFAD0B),
    onSecondaryContainer: Color(0xff9999aa),
    background: Color(0xff151515),
    onBackground: Color(0xfffcfcff),
    surface: Color(0xff1E2746),
    onSurface: Colors.grey,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.dark,
  );
}
