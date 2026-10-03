import 'dart:convert';
import 'package:employee_management/extension/string_extension.dart';
import 'package:employee_management/model/employee.dart';
import 'package:employee_management/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../ipconfig/ipconfig.dart';
import 'employee_details.dart'; // Import EmployeeDetails class

List<Employee> objectsFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));
String objectsToJson(List<Employee> data) => json.encode(List<Employee>.from(data.map((x) => x.toJson())));

class AllEmployee extends StatefulWidget {
  const AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {

  Ipconfig i = Ipconfig();
  late List<Employee> _employees = [];

  //===========================future method============
  Future<List<Employee>> showall() async {
    final response = await http.get(
      Uri.parse('${i.ip}all-employee'),
    );
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Get Data"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed to load employees"); // Changed exception message to be more descriptive
    }
  }
//==========================future method end=================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Employee>>(
        future: showall(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) { // Added connectionState check
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // Improved error message
          } else if (snapshot.hasData && snapshot.data != null) { // Added null check for data
            _employees = snapshot.data!;
            return ListView.builder(
              itemCount: _employees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_employees[index].name.toString().capitalize()),
                  leading: Text(_employees[index].employeeId.toString().capitalize()),
                  subtitle: Text("${_employees[index].email.toString().toLowerCase()} ${_employees[index].phoneNo.toString().toLowerCase()}"),
                  trailing: Text(_employees[index].salary.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeDetails(employee: _employees[index]), // Pass the selected employee
                      ),
                    );
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
