import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle _headline1 = TextStyle(
  fontSize: 40,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

TextStyle _headline3 = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

TextStyle _headline5 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

TextStyle _caption = TextStyle(
  fontSize: 12,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

TextStyle _bodyText1 = TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.normal,
);

ThemeData myStyleData = ThemeData(
    backgroundColor: Colors.grey,
    primaryColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 70, vertical: 14)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                  color: Colors.orange, style: BorderStyle.solid, width: 4))),
          backgroundColor: MaterialStateProperty.all(Color(0xFF808080)),
          shadowColor: MaterialStateProperty.all(Colors.red),
          elevation: MaterialStateProperty.all(12.0)),
    ),
    textTheme: TextTheme(
      headline1: _headline1,
      headline3: _headline3,
      headline5: _headline5,
      caption: _caption,
      bodyText1: _bodyText1,
    ));
