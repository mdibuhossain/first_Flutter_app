import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_android_app/models/catalog.dart';
import 'package:test_android_app/widgets/item_widget.dart';
import 'package:test_android_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 360;
  final String name = "Ibrahim";

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final dummyItem = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
      ),
      drawer: MyDrawer(),
      body: CupertinoScrollbar(
        thickness: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
            itemCount: dummyItem.length,
            itemBuilder: (context, index) => ItemWidget(
              item: dummyItem[index],
            ),
          ),
        ),
      ),
    );
  }
}
