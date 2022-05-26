// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class AppTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static AppTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color? primaryColor;
  Color? secondaryColor;
  Color? tertiaryColor;
  Color? alternate;
  Color? primaryBackground;
  Color? secondaryBackground;
  Color? primaryText;
  Color? secondaryText;

  Color? primaryBtnText;
  Color? lineColor;

  TextStyle get title1 => TextStyle(        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );
  TextStyle get title2 => TextStyle(  
        
        color: secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  TextStyle get title3 => TextStyle(  
        
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get subtitle1 => TextStyle(  
       
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get subtitle2 => TextStyle(  
       
        color: secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  TextStyle get bodyText1 => TextStyle(  
        
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  TextStyle get bodyText2 => TextStyle(  
        
        color: secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
}

class LightModeTheme extends AppTheme {
  Color? primaryColor = const Color(0xFF7262FF);
  Color? secondaryColor = const Color(0xFF39D2C0);
  Color? tertiaryColor = const Color(0xFFEE8B60);
  Color? alternate = const Color(0xFFFF5963);
  Color? primaryBackground = const Color(0xFF1F1E26);
  Color? secondaryBackground = const Color(0xFFFFFFFF);
  Color? primaryText = const Color(0xFF101213);
  Color? secondaryText = const Color(0xFF57636C);

  Color? primaryBtnText = Color(0xFFFFFFFF);
  Color? lineColor = Color(0xFFE0E3E7);
}

class DarkModeTheme extends AppTheme {
  Color? primaryColor = const Color(0x00000000);
  Color? secondaryColor = const Color(0xFF39D2C0);
  Color? tertiaryColor = const Color(0xFFEE8B60);
  Color? alternate = const Color(0xFFFF5963);
  Color? primaryBackground = const Color(0x00000000);
  Color? secondaryBackground = const Color(0xFF101213);
  Color? primaryText = const Color(0xFFFFFFFF);
  Color? secondaryText = const Color(0xFF95A1AC);

  Color? primaryBtnText = Color(0xFFFFFFFF);
  Color? lineColor = Color(0xFF22282F);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? TextStyle(  
              
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
             
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
