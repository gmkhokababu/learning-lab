import 'package:flutter/material.dart';
import 'package:res_final/main.dart';
import 'package:res_final/pages/allFoods.dart';
import 'package:res_final/pages/login.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    image: AssetImage('images/banner-1.jpeg'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.fastfood_outlined),
            title: const Text('Food Menu'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Allfoods()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notification_important),
            title: const Text('Notification'),
            onTap: () => print('Notification'),
          ),

          Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Login'),
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
            },
          ),
        ],
      ),
    );
  }
}
