import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:res_final/pages/login.dart';
import 'package:res_final/pages/tableinformation.dart';

import 'main.dart';

class Customernav extends StatelessWidget {
  const Customernav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Food & Coffee"),
            accountEmail: const Text("You can't eat less"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/logo.png'),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                    image: AssetImage('banner-1.jpeg'), fit: BoxFit.cover)),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
            },
          ),



          ListTile(
            leading: const Icon(Icons.table_bar_outlined),
            title: const Text('Table Information'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Tableinformation()));
            },
          ),




          Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
            },
          ),
        ],
      ),
    );
  }
}
