import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_project/home.dart';
import 'package:my_project/service.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Abu Hossain"),
            accountEmail: Text("gmabuhossain42@gmail.com"),
          ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ListTile(
            leading: Icon(Icons.design_services),
            title: Text("Services"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyService()));
            },
          ),
        ],
      ),
    );
  }
}
