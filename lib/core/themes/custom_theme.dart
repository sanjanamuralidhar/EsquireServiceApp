import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme() {
    return ThemeData(
      errorColor: Colors.red,
      chipTheme: ChipThemeData(
          disabledColor: Colors.grey,
          selectedColor: Colors.red,
          labelStyle: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          backgroundColor: Colors.grey,
          secondarySelectedColor: Colors.red,
          labelPadding: EdgeInsets.all(5),
          padding: EdgeInsets.all(3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          secondaryLabelStyle: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          brightness: Brightness.light),
      primaryIconTheme: IconThemeData(color: Colors.white),
      accentIconTheme: IconThemeData(color: Colors.blue),
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.grey),
          headline1: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.red[400]),
          headline3: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
          headline4: TextStyle(fontSize: 12, color: Colors.grey)),
      primarySwatch: Colors.red,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      inputDecorationTheme: const InputDecorationTheme(
        // labelStyle: TextStyle(color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 10,
        ),
      ),
    );
  }
}
