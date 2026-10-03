// components/drawer_widget.dart

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Admin Panel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Add Employee'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/add_employee');
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Show All Employees'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/employee_list');
            },
          ),
          ListTile(
            leading: Icon(Icons.request_page),
            title: Text('Voucher List'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/voucher_list');
            },
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text('Make Attendance'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/attendance');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Show Attendance Report'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/attendance_report');
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Give Notice'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/notice');
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Salary Impose'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/salary_impose');
            },
          ),
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Salary Report'),
            onTap: () {
              Navigator.popAndPushNamed(context, '/salary_report');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Implement logout logic
              Navigator.popAndPushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
