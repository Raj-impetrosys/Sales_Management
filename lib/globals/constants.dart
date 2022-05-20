import 'package:flutter/material.dart';

class Constants {
  static const String projectName = 'Sales Management';
  static const String fontFamily = 'Montserrat';
  static const Color fontColor = Color(0xff4E4874);
  static const Color fontColorLightGrey = Color(0xff9FA1BC);
  static const Color backgroundColor = Color(0xffFBFDFF);
  static const Locale locale = Locale.fromSubtags(languageCode: 'en');
  static const TextStyle titleTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff363853));
  static const TextStyle subtitleTextStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff363853));
  static List<BoxShadow> shadow = [
    BoxShadow(
        blurRadius: 1,
        spreadRadius: 1,
        color: const Color(0xffDDD6D6).withOpacity(0.5))
  ];
}
