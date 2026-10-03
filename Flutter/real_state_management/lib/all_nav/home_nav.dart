import 'package:flutter/material.dart';
import 'package:real_state_management/login.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(""),
              accountEmail: Text("")
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Login"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            },
          )
        ],
      ),
    );
  }
}
