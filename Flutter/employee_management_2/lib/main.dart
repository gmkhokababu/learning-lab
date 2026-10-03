// main.dart

import 'package:employee_management_2/admin/salary-empose.dart';
import 'package:employee_management_2/admin/salary_report.dart';
import 'package:employee_management_2/admin/show_attendance.dart';
import 'package:flutter/material.dart';
// import 'package:your_project_name/components/drawer_widget.dart';
// import 'package:your_project_name/screens/login.dart';
// import 'package:your_project_name/screens/add_employee.dart';
// import 'package:your_project_name/screens/employee_list.dart';
// import 'package:your_project_name/screens/voucher_list.dart';
// import 'package:your_project_name/screens/attendance.dart';
// import 'package:your_project_name/screens/show_attendance.dart';
// import 'package:your_project_name/screens/notice.dart';
// import 'package:your_project_name/screens/salary_impose.dart';
// import 'package:your_project_name/screens/salary_report.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        // '/login': (context) => LoginScreen(),
        // '/add_employee': (context) => AddEmployeeScreen(),
        // '/employee_list': (context) => EmployeeListScreen(),
        // '/voucher_list': (context) => VoucherListScreen(),
        // '/attendance': (context) => AttendanceScreen(),
        '/attendance_report': (context) => ShowAttendanceScreen(),
        // '/notice': (context) => NoticeScreen(),
        '/salary_impose': (context) => SalaryImposeScreen(),
        '/salary_report': (context) => SalaryReportScreen(),
      },
    );
  }
}
