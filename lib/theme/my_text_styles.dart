import 'package:flutter/material.dart';
import 'package:my_flutter_project/constants/sizes.dart';
import 'package:my_flutter_project/theme/my_colors.dart';

/***
 * 
 * Styling the text of our App
 */

//header text style
TextStyle get _headerLine1 => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: Sizes.dimen_16,
      color: whiteColor,
      height: Sizes.dimen_2,
    );

//sub title text style
TextStyle get _subtitle1 => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: Sizes.dimen_11,
      color: whiteColor,
      height: Sizes.dimen_2,
      letterSpacing: Sizes.dimen_2,
    );

//sub title 2 (For minute info) text style
TextStyle get _subtitle2 => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: Sizes.dimen_10,
      color: whiteColor,
      height: Sizes.dimen_2,
      letterSpacing: Sizes.dimen_2,
    );

// body text style
TextStyle get _bodyText1 => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: Sizes.dimen_12,
      color: primaryColor,
      height: Sizes.dimen_2,
    );

// Button text style
TextStyle get _btnTextStyle => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: Sizes.dimen_16,
      color: whiteColor,
      height: Sizes.dimen_2,
    );

//Text Button style
TextStyle get _txtButtonStyle => TextStyle(
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: Sizes.dimen_10,
      color: btnColor,
      height: Sizes.dimen_2,
    );

TextTheme txtTheme = TextTheme(
  headline1: _headerLine1,
  subtitle1: _subtitle1,
  subtitle2: _subtitle2,
  bodyText1: _bodyText1,
  button: _btnTextStyle,
  caption: _txtButtonStyle,
);

ThemeData myThemeData = ThemeData(
  backgroundColor: primaryColor,
  scaffoldBackgroundColor: primaryColor,
  textTheme: txtTheme,
  primaryColor: primaryColor,
);
