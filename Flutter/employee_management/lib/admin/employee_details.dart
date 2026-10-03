import 'package:employee_management/extension/string_extension.dart';
import 'package:employee_management/model/employee.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  final Employee employee;

  const EmployeeDetails({super.key, required this.employee}); // Accept employee parameter

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee.name?.capitalize() ?? 'Employee Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('ID: ${widget.employee.employeeId ?? ''}'),
            SizedBox(height: 8),
            Text('Name: ${widget.employee.name?.capitalize() ?? ''}'),
            SizedBox(height: 8),
            Text('Email: ${widget.employee.email?.toLowerCase() ?? ''}'),
            SizedBox(height: 8),
            Text('Phone: ${widget.employee.phoneNo?.toLowerCase() ?? ''}'),
            SizedBox(height: 8),
            Text('Department ID: ${widget.employee.departmentId ?? ''}'),
            SizedBox(height: 8),
            Text('Role ID: ${widget.employee.roleId ?? ''}'),
            SizedBox(height: 8),
            Text('Date of Joining: ${widget.employee.dateOfJoining ?? ''}'),
            SizedBox(height: 8),
            Text('Salary: ${widget.employee.salary ?? ''}'),
            SizedBox(height: 8),
            Text('Address: ${widget.employee.address ?? ''}'),
            SizedBox(height: 8),
            // Text('Attendance Status: ${widget.employee.attendancestatus ?? ''}'),
          ],
        ),
      ),
    );
  }
}

