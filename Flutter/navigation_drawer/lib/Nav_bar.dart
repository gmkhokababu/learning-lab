import 'package:flutter/material.dart';
import 'package:navigation_drawer/home.dart';
import 'package:navigation_drawer/main.dart';
import 'package:navigation_drawer/page1.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Abu Hossain"),
              accountEmail: Text("gmkhokababu@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("images/abu.jpg",fit: BoxFit.fill,),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Home"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Pro"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setings"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Hello Settings"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ],
      ),
    );
  }
}
