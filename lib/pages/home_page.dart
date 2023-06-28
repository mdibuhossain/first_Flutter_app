import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 360;
  final String name = "Ibrahim";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Text("Hello $name $days"),
      ),
    );
  }
}
