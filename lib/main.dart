import 'package:flutter/material.dart';
import 'package:test_android_app/pages/home_page.dart';
import 'package:test_android_app/pages/login_page.dart';
import 'package:test_android_app/utils/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        MyRouters.homeRoute: (context) => HomePage(),
        MyRouters.loginRoute: (context) => LoginPage()
      },
    );
  }
}
