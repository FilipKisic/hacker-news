import 'package:flutter/material.dart';

// core
const _standard = TextStyle(fontSize: 16, fontFamily: 'ChakraPetch');
const _appBarTitle = TextStyle(
  fontSize: 24,
  fontFamily: 'Doto',
  fontWeight: FontWeight.w700,
);
const _title = TextStyle(
  fontSize: 18,
  fontFamily: 'Doto',
  fontWeight: FontWeight.w800,
);

// story card
const _cardAuthor = TextStyle(fontSize: 14, fontFamily: 'ChakraPetch');
const _cardStats = TextStyle(fontSize: 13, fontFamily: 'ChakraPetch');

extension CustomTextTheme on TextTheme {
  TextStyle get standard => _standard;
  TextStyle get appBarTitle => _appBarTitle;
  TextStyle get title => _title;
  TextStyle get cardAuthor => _cardAuthor;
  TextStyle get cardStats => _cardStats;
}
