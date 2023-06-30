// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String proPhoto =
        "https://scontent.fdac99-1.fna.fbcdn.net/v/t39.30808-6/343067589_750916040011586_1746464866806715805_n.jpg?_nc_cat=100&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=irTj_gLnRXMAX-oZPcj&_nc_ht=scontent.fdac99-1.fna&oh=00_AfDB6fxq-e-8LHSBuHokteKc-n1peTuN1pqivvzrFNlZhw&oe=64A306FF";
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.deepOrangeAccent),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                ),
                accountEmail: Text("ibuhossain3@gmail.com"),
                accountName: Text("Ibrahim Hossain"),
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(proPhoto),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home"),
              onTap: () {
                print("home");
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
              title: Text("About"),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.back,
                color: Colors.white,
              ),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
