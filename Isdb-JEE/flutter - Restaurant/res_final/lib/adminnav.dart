import 'package:flutter/material.dart';
import 'package:res_final/main.dart';
import 'package:res_final/pages/admindashboard.dart';
import 'package:res_final/pages/bookingInformation.dart';
import 'package:res_final/pages/foodInformation.dart';
import 'package:res_final/pages/login.dart';
import 'package:res_final/pages/register.dart';
import 'package:res_final/pages/tableinformation.dart';

class Adminnav extends StatelessWidget {
  const Adminnav({super.key});

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
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Admindashboard()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.food_bank_rounded),
            title: const Text('Food Information'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Foodinformation()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.table_bar_outlined),
            title: const Text('Table Information'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Tableinformation()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.bookmark_add_outlined),
            title: const Text('Booking Information'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Bookinginformation()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.bookmark_add_outlined),
            title: const Text('Register'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
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
