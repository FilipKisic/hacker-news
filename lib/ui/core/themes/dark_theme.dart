import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/colors.dart';

final darkTheme = ThemeData(
  fontFamily: 'ChakraPetch',
  scaffoldBackgroundColor: backgroundColorDark,
  shadowColor: shadowColorDark,
  splashColor: accentColorDark.withAlpha(45),
  highlightColor: accentColorDark.withAlpha(60),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundColorDark,
    selectedItemColor: accentColorDark,
    unselectedItemColor: textSecondaryColorDark,
  ),
  extensions: const [
    AppColors(
      backgroundColor: backgroundColorDark,
      primaryColor: primaryColorDark,
      accentColor: accentColorDark,
      textColor: textColorDark,
      textSecondaryColor: textSecondaryColorDark,
      errorColor: errorColorDark,
      shadowColor: shadowColorDark,
    ),
  ],
);
