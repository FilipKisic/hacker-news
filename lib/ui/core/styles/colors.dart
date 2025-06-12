import 'package:flutter/material.dart';

// LIGHT COLORS
const backgroundColorLight = Color(0xFFF2F2F2);
const primaryColorLight = Color(0xFF8DEBD2);
const accentColorLight = Color(0xFFA093FF);
const textColorLight = Color(0xFF1D1C29);
const textSecondaryColorLight = Color(0xFF959CAB);
const errorColorLight = Color(0xFFE33D3D);
const shadowColorLight = Color(0x25A2A2A2);

// DARK COLORS
const backgroundColorDark = Color(0xFF1D1C29);
const primaryColorDark = Color(0xFF8DEBD2);
const accentColorDark = Color(0xFFA093FF);
const textColorDark = Color(0xFFF2F2F2);
const textSecondaryColorDark = Color(0xFF959CAB);
const errorColorDark = Color(0xFFE33D3D);
const shadowColorDark = Color(0x25000000);

class AppColors extends ThemeExtension<AppColors> {
  final Color? backgroundColor;
  final Color? primaryColor;
  final Color? accentColor;
  final Color? textColor;
  final Color? textSecondaryColor;
  final Color? errorColor;
  final Color? shadowColor;

  const AppColors({
    required this.backgroundColor,
    required this.primaryColor,
    required this.accentColor,
    required this.textColor,
    required this.textSecondaryColor,
    required this.errorColor,
    required this.shadowColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    final Color? backgroundColor,
    final Color? primaryColor,
    final Color? accentColor,
    final Color? textColor,
    final Color? textSecondaryColor,
    final Color? errorColor, 
    final Color? shadowColor, 
  }) =>
      AppColors(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        primaryColor: primaryColor ?? this.primaryColor,
        accentColor: accentColor ?? this.accentColor,
        textColor: textColor ?? this.textColor,
        textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
        errorColor: errorColor ?? this.errorColor,
        shadowColor: shadowColor ?? this.shadowColor,
      );

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      textSecondaryColor: Color.lerp(textSecondaryColor, other.textSecondaryColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
    );
  }
}