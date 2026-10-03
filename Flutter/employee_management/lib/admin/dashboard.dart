import 'package:employee_management/navigation/nav.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Admin Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildDashboardButton(context, Icons.man_3_rounded, "All Employee", () {
              Navigator.pushNamed(context, '/allEmployee');
            }),
            _buildDashboardButton(context, Icons.add, "Add Employee", () {
              Navigator.pushNamed(context, '/addEmployee');
            }),
            _buildDashboardButton(context, Icons.calendar_month, "Attendance", () {
              Navigator.pushNamed(context, '/employeeAttendance');
            }),
            _buildDashboardButton(context, Icons.report, "Attendance Report", () {
              Navigator.pushNamed(context, '/searchAttendance');
            }),
            _buildDashboardButton(context, Icons.attach_money, "Salary", () {
              Navigator.pushNamed(context, '/salaryReport');
            }),
            _buildDashboardButton(context, Icons.time_to_leave, "Leave Request", () {
              Navigator.pushNamed(context, '/adminLeaveRequest');
            }),
            _buildDashboardButton(context, Icons.check_circle, "Leave Status", () {
              Navigator.pushNamed(context, '/userLeaveRequestStatus');
            }),
            _buildDashboardButton(context, Icons.check_circle_outline, "Vouchers Requested", () {
              Navigator.pushNamed(context, '/adminVoucherRequest');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16.0),
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
