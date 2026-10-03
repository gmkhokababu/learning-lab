import 'dart:convert';

import 'package:employee_management/admin/add_employee.dart';
import 'package:employee_management/admin/admin_leave_request_screen.dart';
import 'package:employee_management/admin/admin_voucher_request_screen.dart';
import 'package:employee_management/admin/all_employees.dart';
import 'package:employee_management/admin/dashboard.dart';
import 'package:employee_management/admin/employee_attandance.dart';
import 'package:employee_management/admin/salary_report.dart';
import 'package:employee_management/admin/search_attendance.dart';
import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/user.dart';
import 'package:employee_management/user/add_voucher_screen.dart';
import 'package:employee_management/user/show_voucher_status_screen.dart';
import 'package:employee_management/user/user_leave_request.dart';
import 'package:employee_management/user/user_leave_request_status.dart';
import 'package:employee_management/user/users_dashboard.dart';
import 'package:employee_management/user/voucher_screen_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<User> objectsFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String objectsToJson(List<User> data) =>
    json.encode(List<User>.from(data).map((x) => x.toJson()));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Employee Management'),
      routes: {
        //admin routes part
        '/adminLeaveRequest': (context) => AdminLeaveRequestScreen(),
        '/adminVoucherRequest': (context) => AdminVoucherRequestScreen(),
        '/allEmployee': (context) => AllEmployee(),
        '/addEmployee': (context) => AddEmployee(),
        '/employeeAttendance': (context) => EmployeeAttendance(),
        '/searchAttendance': (context) => SearchAttendance(),
        '/salaryReport': (context) => SalaryReport(),
        '/dashboard': (context) => Dashboard(),


        //user routes part
        '/user_dashboard': (context) => UserDashboard(),
        '/vouchers': (context) => VouchersScreen(),
        '/addVoucher': (context) => AddVoucherScreen(),
        '/showVoucherStatus': (context) => ShowVoucherStatusScreen(),
        '/userLeaveRequest': (context) => UserLeaveRequestScreen(),
        '/userLeaveRequestStatus': (context) => UserLeaveRequestStatusScreen(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  Ipconfig i = Ipconfig();

  Future<User> loginAdmin() async {
    final responce =
        await http.get(Uri.parse('${i.ip}${_userName.text}/${_password.text}'));
    if (responce.statusCode == 200) {
      SnackBar s= SnackBar(content: Text("Login Future"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return User.fromJson(jsonDecode(responce.body));
    } else {
      throw Exception("Error");
    }
  }

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _userName,
                  decoration: InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // String? username=_userName.text.toString();
                    // String? password=_password.text.toString();
                    // SnackBar ss= SnackBar(content: Text('${i.ip}${_userName.text}/${_password.text}'));
                    //             ScaffoldMessenger.of(context).showSnackBar(ss);
                    try {
                      User u = await loginAdmin();
                      if (u != null && u.userName == "admin") {
                        // SnackBar s= SnackBar(content: Text("Login success"));
                        // ScaffoldMessenger.of(context).showSnackBar(s);
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      } else if (u != null && u.userName == "user") {
                        // SnackBar s= SnackBar(content: Text("Login success"));
                        // ScaffoldMessenger.of(context).showSnackBar(s);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDashboard()));
                      } else {
                        SnackBar s = SnackBar(content: Text("Login faild"));
                        ScaffoldMessenger.of(context).showSnackBar(s);
                      }
                      ;
                    }catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to fetch data: $e")),
                      );
                    }
                  },
                  child: Text("Log In")),
            ],
          ),
        ),
      ),
    );
  }
}
