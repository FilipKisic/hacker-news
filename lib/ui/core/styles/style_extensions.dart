import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/colors.dart';

extension StyleExtension on BuildContext {
  Color get colorBackground => Theme.of(this).extension<AppColors>()!.backgroundColor!;
  Color get colorPrimary => Theme.of(this).extension<AppColors>()!.primaryColor!;
  Color get colorAccent => Theme.of(this).extension<AppColors>()!.accentColor!;
  Color get colorError => Theme.of(this).extension<AppColors>()!.errorColor!;
  Color get colorText => Theme.of(this).extension<AppColors>()!.textColor!;
}