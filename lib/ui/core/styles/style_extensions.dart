import 'package:flutter/material.dart';
import 'package:hacker_news_app/ui/core/styles/colors.dart';
import 'package:hacker_news_app/ui/core/styles/text_styles.dart';

extension StyleExtension on BuildContext {
  Color get colorBackground => Theme.of(this).extension<AppColors>()!.backgroundColor!;
  Color get colorPrimary => Theme.of(this).extension<AppColors>()!.primaryColor!;
  Color get colorAccent => Theme.of(this).extension<AppColors>()!.accentColor!;
  Color get colorError => Theme.of(this).extension<AppColors>()!.errorColor!;
  Color get colorText => Theme.of(this).extension<AppColors>()!.textColor!;
  Color get colorTextSecondary => Theme.of(this).extension<AppColors>()!.textSecondaryColor!;

  TextStyle get textStandard => Theme.of(this).textTheme.standard;
  TextStyle get textAppBarTitle => Theme.of(this).textTheme.appBarTitle;
  TextStyle get textTitle => Theme.of(this).textTheme.title;
  TextStyle get textCardAuthor => Theme.of(this).textTheme.cardAuthor;
  TextStyle get textCardStats => Theme.of(this).textTheme.cardStats;
}