// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_android_app/models/catalog.dart';
import 'package:test_android_app/widgets/item_widget.dart';
import 'package:test_android_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productList = decodeData["products"];
    CatalogModel.items =
        List.from(productList).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
      ),
      drawer: MyDrawer(),
      body: CupertinoScrollbar(
        thickness: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items?.length,
                  itemBuilder: (context, index) => ItemWidget(
                    item: CatalogModel.items![index],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
