import 'package:employee_management/main.dart';
import 'package:flutter/material.dart';

class UserNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, '/user_dashboard');
            },
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Voucher'),
            onTap: () {
              Navigator.pushNamed(context, '/vouchers');
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notice'),
            onTap: () {
              Navigator.pushNamed(context, '/notice');
            },
          ),
          ListTile(
            leading: Icon(Icons.time_to_leave),
            title: Text('Leave'),
            onTap: () {
              Navigator.pushNamed(context, '/userLeaveRequest');
            },
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Leave Status'),
            onTap: () {
              Navigator.pushNamed(context, '/userLeaveRequestStatus');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
              // Add log out functionality here
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));  // Close the drawer
            },
          ),
        ],

      ),
    );
  }
}
