// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    final response = await http
        .get(Uri.parse("https://api.jsonbin.io/v3/b/64a1e5c1b89b1e2299b8c2d9"));
    final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productList = decodeData["record"]["products"];
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
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
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
