import 'package:flutter/material.dart';
import 'package:real_state_management/main.dart';
import 'package:real_state_management/owner/add_listing.dart';
import 'package:real_state_management/owner/admin_shedule.dart';
import 'package:real_state_management/owner/all_listing.dart';
import 'package:real_state_management/owner/owner.dart';
import 'package:real_state_management/owner/owner_notification.dart';

class OwnerNav extends StatelessWidget {
  const OwnerNav({super.key});

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
            leading: Icon(Icons.logout),
            title: Text("Dashboard"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Owner()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("All Listing"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AllListing()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Add Listing"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddListing()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Notification"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerNotification()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Shedule"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminShedule()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
            },
          ),
        ],
      ),
    );
  }
}
