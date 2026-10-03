import 'package:flutter/material.dart';
import 'package:res_final/adminnav.dart';

class Admindashboard extends StatefulWidget {
  const Admindashboard({super.key});

  @override
  State<Admindashboard> createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Admin Dashboard",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Image.asset("images/banner-3.jpg"),
          Text("Welcome Admin",style: TextStyle(fontSize: 50),)
        ],
      ),
    );
  }
}
