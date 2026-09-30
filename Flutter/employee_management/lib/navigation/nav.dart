import 'package:employee_management/admin/add_employee.dart';
import 'package:employee_management/admin/all_employees.dart';
// import 'package:employee_management/admin/employee_attendance.dart';
import 'package:employee_management/admin/salary_report.dart';
import 'package:employee_management/admin/search_attendance.dart';
import 'package:employee_management/main.dart';
import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin Name", style: TextStyle(color: Colors.white)),
            accountEmail: Text("admin@example.com", style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("A", style: TextStyle(fontSize: 24.0, color: Colors.blueAccent)),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          _buildDrawerItem(context, Icons.dashboard, "Dashboard", '/dashboard'),
          _buildDrawerItem(context, Icons.man_3_rounded, "All Employee", '/allEmployee'),
          _buildDrawerItem(context, Icons.add, "Add Employee", '/addEmployee'),
          _buildDrawerItem(context, Icons.calendar_month, "Attendance", '/employeeAttendance'),
          _buildDrawerItem(context, Icons.report, "Attendance Report", '/searchAttendance'),
          _buildDrawerItem(context, Icons.attach_money, "Salary", '/salaryReport'),
          _buildDrawerItem(context, Icons.time_to_leave, "Leave Request", '/adminLeaveRequest'),
          _buildDrawerItem(context, Icons.check_circle, "Leave Status", '/userLeaveRequestStatus'),
          _buildDrawerItem(context, Icons.check_circle_outline, "Vouchers Requested", '/adminVoucherRequest'),
          _buildDrawerItem(context, Icons.logout, "Logout", '/', () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String routeName, [VoidCallback? onTap]) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: TextStyle(color: Colors.blueAccent)),
      onTap: onTap ?? () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
