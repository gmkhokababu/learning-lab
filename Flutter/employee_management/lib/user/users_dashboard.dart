import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/employee.dart';
import 'package:employee_management/navigation/user_nav.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    final response = await http.get(Uri.parse('${Ipconfig().ip}all-employee'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        employees = data.map((e) => Employee.fromJson(e)).toList();
      });
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load employees')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNav(),
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, [User Name]',  // Replace with actual user name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildCard('Voucher', Icons.card_giftcard, () {
                    // Navigate to the Voucher screen
                    Navigator.pushNamed(context, '/vouchers');
                  }),
                  _buildCard('Notice', Icons.notifications, () {
                    // Navigate to the Notice screen
                  }),
                  _buildCard('Leave Request', Icons.time_to_leave, () {
                    // Navigate to the Leave screen
                    Navigator.pushNamed(context, '/userLeaveRequest');
                  }),
                  _buildCard('Leave Status', Icons.check_circle, () {
                    // Navigate to the Leave Status screen
                    Navigator.pushNamed(context, '/userLeaveRequestStatus');
                  }),
                ],
              ),
            ),
            // SizedBox(height: 20),
            // Text(
            //   'Employee Details:',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: employees.length,
            //     itemBuilder: (context, index) {
            //       final employee = employees[index];
            //       return ListTile(
            //         title: Text(employee.name),
            //         subtitle: Text('Department ID: ${employee.departmentId}, Role ID: ${employee.roleId}'),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.blueAccent),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
