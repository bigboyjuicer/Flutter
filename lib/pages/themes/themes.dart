import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  static final darkTheme = ThemeData(
    primaryColor: Colors.white,
    indicatorColor: const Color(0xffB1B1B1),
    cardColor: const Color(0xff0D182C),
    bottomAppBarColor: const Color(0xff071427),
    dividerColor: Colors.white,
    dialogBackgroundColor: const Color(0xff0C172B),
    backgroundColor:  const Color(0xff0D172B),
    selectedRowColor: const Color(0xffCCCCCC),
    splashColor: const Color(0xff223B70),
    highlightColor: const Color(0xff0F1F40),
    buttonColor: const Color(0xff152A53),
    hoverColor: Colors.white,
    canvasColor: const Color(0xff0D172B),
    hintColor: Colors.white,
    textTheme: TextTheme(
      headline1: GoogleFonts.manrope(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: -3,
      ),
      headline2: GoogleFonts.manrope(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline3: GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline4: GoogleFonts.manrope(
        fontSize: 18,
        color: Colors.white,
      ),
      headline5: GoogleFonts.manrope(
        fontSize: 17,
        color: Colors.white,
      ),
      headline6: GoogleFonts.manrope(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.black,
    indicatorColor: const Color(0xff5A5A5A),
    cardColor: const Color(0xffE0E9FD),
    bottomAppBarColor: const Color(0xffE2EBFF),
    dividerColor: const Color(0xff038CFE),
    dialogBackgroundColor: const Color(0xffE2EBFF),
    backgroundColor:  const Color(0xffE2EBFF),
    selectedRowColor: Colors.black,
    splashColor: const Color(0xffCDDAF5),
    highlightColor: const Color(0xff9CBCFF),
    buttonColor: const Color(0xffC8DAFF),
    hoverColor: const Color(0xffE2EBFF),
    canvasColor: const Color(0xff4B5F88),
    hintColor: Colors.black,
    textTheme: TextTheme(
      headline1: GoogleFonts.manrope(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: -3,
      ),
      headline2: GoogleFonts.manrope(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline3: GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline4: GoogleFonts.manrope(
        fontSize: 18,
        color: Colors.white,
      ),
      headline5: GoogleFonts.manrope(
        fontSize: 17,
        color: Colors.black,
      ),
      headline6: GoogleFonts.manrope(
        fontSize: 14,
        color: const Color(0xff038CFE),
      ),
    ),
  );
}
