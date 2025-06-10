import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/colors.dart';

final darkTheme = ThemeData(
  fontFamily: 'ChakraPetch',
  scaffoldBackgroundColor: backgroundColorDark,
  shadowColor: shadowColorDark,
  splashColor: primaryColorDark.withAlpha(45),
  highlightColor: primaryColorDark.withAlpha(60),
  extensions: const [
    AppColors(
      backgroundColor: backgroundColorDark,
      primaryColor: primaryColorDark,
      accentColor: accentColorDark,
      textColor: textColorDark,
      errorColor: errorColorDark,
      shadowColor: shadowColorDark,
    ),
  ],
);
