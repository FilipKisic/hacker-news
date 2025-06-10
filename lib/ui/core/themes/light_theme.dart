import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/colors.dart';

final lightTheme = ThemeData(
  fontFamily: 'ChakraPetch',
  scaffoldBackgroundColor: backgroundColorLight,
  shadowColor: shadowColorLight,
  splashColor: primaryColorLight.withAlpha(45),
  highlightColor: primaryColorLight.withAlpha(60),
  extensions: const [
    AppColors(
      backgroundColor: backgroundColorLight,
      primaryColor: primaryColorLight,
      accentColor: accentColorLight,
      textColor: textColorLight,
      errorColor: errorColorLight,
      shadowColor: shadowColorLight,
    ),
  ],
);
