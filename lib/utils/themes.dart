// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: Theme.of(context).textTheme,
        appBarTheme: AppBarTheme(
          color: Colors.orange,
        ),
      );
}
