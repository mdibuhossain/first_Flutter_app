// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_app/pages/home_page.dart';
import 'package:test_android_app/pages/login_page.dart';
import 'package:test_android_app/utils/routers.dart';
import 'package:test_android_app/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRouters.homeRoute,
      routes: {
        MyRouters.loginRoute: (context) => LoginPage(),
        MyRouters.homeRoute: (context) => HomePage(),
      },
    );
  }
}
