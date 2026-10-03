import 'package:flutter/material.dart';
import 'package:navigation_drawer/page1.dart';

import 'main.dart';

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
            accountName: const Text("Sazid"),
            accountEmail: const Text("sazid@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/profile.jpg'),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                image: DecorationImage(
                    image: AssetImage('images/ bg.jpg'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: const Icon(Icons.file_upload),
            title: const Text('Upolad Shot'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Page1()));
            },

          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => print('Profile'),
          ),
          ListTile(
            leading: const Icon(Icons.mail_outline_outlined),
            title: const Text('Message'),
            onTap: () => print('Message'),
          ),
          ListTile(
            leading: const Icon(Icons.auto_graph),
            title: const Text('Stats'),
            onTap: () => print('Stats'),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => print('Share'),
          ),
          ListTile(
            leading: const Icon(Icons.notification_important),
            title: const Text('Notification'),
            onTap: () => print('Notification'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () => print('Settings'),
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Signout'),
            onTap: () => print('Signout'),
          ),
        ],
      ),
    );
  }
}
