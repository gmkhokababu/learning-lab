import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/employee.dart';
import 'package:employee_management/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeAttendance extends StatefulWidget {
  @override
  _EmployeeAttendanceState createState() => _EmployeeAttendanceState();
}

class _EmployeeAttendanceState extends State<EmployeeAttendance> {
  DateTime _selectedDate = DateTime.now();
  List<Employee> employees = [];
  Map<int, String> _employeeStatuses = {}; // Map to store employee statuses
  bool _loading = true;

  // Additional variables
  String field = "";
  String fieldValue = "";
  String id = "";
  String month = "";
  String year = "";

  assainValue(String _fieldvalue, String _id){
    field="a${DateFormat('dd').format(_selectedDate)}";
    fieldValue=_fieldvalue;
    id=_id;
    month=DateFormat('MMM').format(_selectedDate).toLowerCase();
    year=DateFormat('yyyy').format(_selectedDate);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Field Name: ${field}\nField Value: ${fieldValue}\nID: ${id}\nMonth: ${month}\nYear: ${year}")));
  }

  @override
  void initState() {

    super.initState();
    fetchEmployees();

  }

  Future<void> fetchEmployees() async {
    try {
      final response = await http.get(Uri.parse('${Ipconfig().ip}all-employee'));
      if (response.statusCode == 200) {
        List<Employee> employeeList = (json.decode(response.body) as List)
            .map((data) => Employee.fromJson(data))
            .toList();
        setState(() {
          employees = employeeList;
          _loading = false;
        });
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> makeAttendance() async {
    try {
      final response = await http.get(Uri.parse('${Ipconfig().ip}makeattendance/${field}/${fieldValue}/${id}/${month}/${year}'));
      if (response.statusCode == 200) {
        setState(() {
          _loading = false;
        });
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _employeeStatuses={};
      });
    }
  }

  void _setStatus(int employeeId, String status) {
    setState(() {
      _employeeStatuses[employeeId] = status;
    });
  }

  void _clearStatus(int employeeId) {
    setState(() {
      _employeeStatuses.remove(employeeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Employee Attendance'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text("Select Date"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  final status = _employeeStatuses[employee.employeeId!] ?? "";

                  return Card(
                    child: ListTile(
                      title: Text(employee.name),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,

                        children: <Widget>[
                          status.isEmpty
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                onPressed: () async{
                                   _setStatus(employee.employeeId!, "A");
                                  await assainValue("A", employee.employeeId!.toString());
                                  await makeAttendance();
                                  },
                                child: Text(
                                    "Absent",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  // primary: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () async{
                                  _setStatus(employee.employeeId!, "P");
                                  await assainValue("P", employee.employeeId!.toString());
                                  await makeAttendance();
                                  },
                                  child: Text(
                                  "Present",
                                  style: TextStyle(color: Colors.white),
                                  ),
                                  style: TextButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  // primary: Colors.white,
                                  ),
                                  ),
                                  TextButton(
                                  onPressed: () async{
                                    _setStatus(employee.employeeId!, "L");
                                    await assainValue("L", employee.employeeId!.toString());
                                    await makeAttendance();
                                    },
                                  child: Text(
                                  "Leave",
                                  style: TextStyle(color: Colors.white),
                                  ),
                                  style: TextButton.styleFrom(
                                  backgroundColor: Colors.orange
                                  // primary: Colors.white,
                                ),
                              ),
                            ],
                          )
                              : Row(
                            children: <Widget>[
                              Text(
                                status,
                                style: TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () => _clearStatus(employee.employeeId!),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}