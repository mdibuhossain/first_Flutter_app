// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => print("${item.id} pressed!"),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text(
              ("\$${item.price.toString()}"),
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),
            ),
          ),
        ),
      ),
    );
  }
}
