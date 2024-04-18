import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFF39A552);
  static const Color primaryDarkColor = Color(0xFF141922);
  static const Color blackColor = Color(0xFF060E1E);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color greenColor = Color(0xFF39A552);
  static const Color backgroundColor = Color(0xFFDFECDB);
  static const Color backgroundColorDark = Color(0xFF060E1E);
  static const Color greyColor = Color(0xFFC8C9CB);
  static const Color redColor = Color(0xFFaf000f);
  static const Color anotherBlack = Color(0xFF42505C);

  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 24, fontWeight: FontWeight.w700, color: anotherBlack),
      bodyMedium: GoogleFonts.exo(
          fontSize: 14, fontWeight: FontWeight.w400, color: anotherBlack),
      bodySmall: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.w400, color: anotherBlack),
      displayLarge: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w500, color: anotherBlack),
      displayMedium: GoogleFonts.poppins(
          fontSize: 13, fontWeight: FontWeight.w300, color: anotherBlack),
      displaySmall: GoogleFonts.poppins(
          fontSize: 10, fontWeight: FontWeight.w400, color: anotherBlack),
      headlineLarge: GoogleFonts.poppins(
          fontSize: 24, fontWeight: FontWeight.w700, color: whiteColor),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: whiteColor, size: 32),
      backgroundColor: greenColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.exo(
          fontSize: 22, fontWeight: FontWeight.w400, color: whiteColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
