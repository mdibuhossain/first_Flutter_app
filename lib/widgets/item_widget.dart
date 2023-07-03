// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_app/models/catalog.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});
  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(
        'https://drive.google.com/file/d/18UztO6ysZN_HkQIEtV4LNb01WCvQOtef/view');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: _launchUrl,
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
