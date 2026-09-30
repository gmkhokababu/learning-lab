import 'dart:convert';

import 'package:employee_management/extension/string_extension.dart';
import 'package:employee_management/model/allattendancereport.dart';
import 'package:employee_management/model/short_attendance_report.dart';
import 'package:employee_management/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ipconfig/ipconfig.dart';

List<Allattendancereport> objectsFromJson(String str) => List<Allattendancereport>.from(json.decode(str).map((x) => Allattendancereport.fromJson(x)));
String objectsToJson(List<Allattendancereport> data) => json.encode(List<Allattendancereport>.from(data.map((x) => x.toJson())));
Ipconfig i = Ipconfig();
late List<Allattendancereport> _allattendancereport = [];


//==========================future method end=================
class AttendanceReport extends StatefulWidget {
  final String? year;
  final String? month;
  const AttendanceReport({super.key, required this.year, required this.month,});

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  //===========================future method============
  Future<List<Allattendancereport>> showattendance() async {
    final response = await http.get(
      Uri.parse('${i.ip}attendancereport/'+widget.month.toString()+"/"+widget.year.toString()),
    );
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Get Data"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed to load employees"); // Changed exception message to be more descriptive
    }
  }
  List<Allattendancereport> allattendancereport=[];
  List<ShortAttendanceReport> reports=[];

  @override
  void initState() {
    // showattendance();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(),
      body: FutureBuilder<List<Allattendancereport>>(
        future: showattendance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) { // Added connectionState check
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Improved error message
          } else if (snapshot.hasData && snapshot.data != null) { // Added null check for data
            allattendancereport = snapshot.data!;
            // Initialize counters
            int totalAbsent = 0;
            int totalPresent = 0;
            int totalLeave = 0;

            // Calculate totals for all reports
            for (var report in allattendancereport) {
              totalAbsent += report.countTotalAbsent();
              totalPresent += report.countTotalPresent();
              totalLeave += report.countTotalLeave();
              reports.add(ShortAttendanceReport(attendanceId: report.attendanceId, name: report.employeename, absent: totalAbsent, present: totalPresent, leave: totalLeave));
            }
            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(reports[index].name.toString().capitalize()),
                  // title: Text(_employees[index].name.toString().capitalize()),
                  // leading: Text(_employees[index].employeeId.toString().capitalize()),
                  // subtitle: Text("${_employees[index].email.toString().toLowerCase()} ${_employees[index].phoneNo.toString().toLowerCase()}"),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Absent: "+reports[index].absent.toString()),
                      Text(" Present: "+reports[index].present.toString()),
                      Text(" Leave: "+reports[index].leave.toString())
                    ],
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => EmployeeDetails(employee: _employees[index]), // Pass the selected employee
                      // ),
                    // );
                  },
                );
              },
            );
          } else {
            return Center(child: Text("No employees found")); // Added fallback for no data scenario
          }
        },
      ),
    );
  }
}
