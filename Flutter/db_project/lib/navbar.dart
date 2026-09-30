import 'package:db_project/calculation.dart';
import 'package:db_project/main.dart';
import 'package:db_project/searchId.dart';
import 'package:db_project/showall.dart';
import 'package:db_project/signup.dart';
import 'package:flutter/material.dart';


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
            title: Text("SignUp"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Pro"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Show all"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Hello Settings"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Showall()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("search by id"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Hello Settings"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Searchid()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Calculator"),
            onTap: () {
              // SnackBar s=SnackBar(content: Text("Hello Settings"),);
              // ScaffoldMessenger.of(context).showSnackBar(s);
              Navigator.push(context, MaterialPageRoute(builder: (context) => Calculation()));
            },
          ),
        ],
      ),
    );
  }
}
