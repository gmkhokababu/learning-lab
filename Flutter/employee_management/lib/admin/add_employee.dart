// // screens/add_employee.dart
// import 'package:employee_management/ipconfig/api_service.dart';
// import 'package:employee_management/model/department.dart';
// import 'package:employee_management/model/employee.dart';
// import 'package:employee_management/model/role.dart';
// import 'package:employee_management/navigation/nav.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../ipconfig/ipconfig.dart';
//
//
// class AddEmployee extends StatefulWidget {
//   const AddEmployee({super.key});
//
//   @override
//   State<AddEmployee> createState() => _AddEmployeeState();
// }
//
// class _AddEmployeeState extends State<AddEmployee> {
//   final _formKey = GlobalKey<FormState>();
//   int? employeeId;
//   String? _name;
//   String? _email;
//   String? _phoneNo;
//   int? _departmentId;
//   int? _roleId;
//   String? _dateOfJoining;
//   double? _salary;
//   String? _address;
//   String? _attendancestatus;
//
//   Ipconfig i = Ipconfig();
//   ApiService apiService = ApiService(Ipconfig().ip.toString());
//
//   List<Department> _departments = [];
//   List<Role> _roles = [];
//   Department? _selectedDepartment;
//   Role? _selectedRole;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   Future<void> _fetchData() async {
//     final departments = await apiService.fetchDepartments();
//     final roles = await apiService.fetchRoles();
//     setState(() {
//       _departments = departments;
//       _roles = roles;
//     });
//   }
//
//   Future<void> _addEmployee() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       Employee employee = Employee(
//         employeeId: null, // Set to null since it will be auto-generated
//         name: _name,
//         email: _email,
//         phoneNo: _phoneNo,
//         departmentId: _selectedDepartment?.departmentId,
//         roleId: _selectedRole?.roleId,
//         dateOfJoining: _dateOfJoining,
//         salary: _salary,
//         address: _address,
//         attendancestatus: _attendancestatus,
//       );
//
//       final response = await http.post(
//         Uri.parse('${i.ip}create-employee'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(employee.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Employee added successfully')));
//         Navigator.pop(context);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add employee')));
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Nav(),
//       appBar: AppBar(
//         title: Text('Add Employee'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Phone No'),
//                 keyboardType: TextInputType.phone,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Phone No';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _phoneNo = value;
//                 },
//               ),
//               DropdownButtonFormField<Department>(
//                 decoration: InputDecoration(labelText: 'Department'),
//                 items: _departments.map((Department department) {
//                   return DropdownMenuItem<Department>(
//                     value: department,
//                     child: Text(department.departmentName),
//                   );
//                 }).toList(),
//                 onChanged: (Department? newValue) {
//                   setState(() {
//                     _selectedDepartment = newValue!;
//                   });
//                 },
//                 value: _selectedDepartment,
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a department';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonFormField<Role>(
//                 decoration: InputDecoration(labelText: 'Role'),
//                 items: _roles.map((Role role) {
//                   return DropdownMenuItem<Role>(
//                     value: role,
//                     child: Text(role.roleName),
//                   );
//                 }).toList(),
//                 onChanged: (Role? newValue) {
//                   setState(() {
//                     _selectedRole = newValue!;
//                   });
//                 },
//                 value: _selectedRole,
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Please select a role';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Date of Joining'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Date of Joining';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _dateOfJoining = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Salary'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Salary';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _salary = double.parse(value!);
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Address'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter Address';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _address = value;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _addEmployee,
//                 child: Text('Add Employee'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/department.dart';
import 'package:employee_management/model/employee.dart';
import 'package:employee_management/model/role.dart';
import 'package:employee_management/navigation/nav.dart';

import 'package:intl/intl.dart'; // Add this import for date formatting
// screens/add_employee.dart
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import '../ipconfig/ipconfig.dart';
// import '../model/department.dart';
// import '../model/employee.dart';
// import '../model/role.dart';
// import '../navigation/nav.dart';
// import 'package:intl/intl.dart'; // Add this import for date formatting

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _phoneNo;
  Department? _selectedDepartment;
  Role? _selectedRole;
  DateTime? _dateOfJoining;
  double? _salary;
  String? _address;
  String? _attendancestatus;

  Ipconfig i = Ipconfig();
  List<Department> _departments = [];
  List<Role> _roles = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final departments = await _fetchDepartments();
      final roles = await _fetchRoles();
      setState(() {
        _departments = departments;
        _roles = roles;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to load data: $error')));
    }
  }

  Future<List<Department>> _fetchDepartments() async {
    final response = await http.get(Uri.parse('${i.ip}departments'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Department.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }

  Future<List<Role>> _fetchRoles() async {
    final response = await http.get(Uri.parse('${i.ip}roles'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Role.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load roles');
    }
  }

  Future<void> _addEmployee() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        Employee employee = Employee(
          employeeId: 0,
          name: _name!,
          email: _email!,
          phoneNo: _phoneNo!,
          departmentId: _selectedDepartment!.departmentId,
          roleId: _selectedRole!.roleId,
          dateOfJoining: _dateOfJoining!,
          salary: _salary!,
          address: _address!,
          // attendancestatus: "A",
        );

        final response = await http.post(
          Uri.parse('${i.ip}create-employee'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(employee.toJson()),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Employee added successfully')));
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add employee')));
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $error')));
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateOfJoining ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _dateOfJoining) {
      setState(() {
        _dateOfJoining = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Add Employee'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone No',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Phone No';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNo = value;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<Department>(
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                ),
                items: _departments.map((Department department) {
                  return DropdownMenuItem<Department>(
                    value: department,
                    child: Text(department.departmentName),
                  );
                }).toList(),
                onChanged: (Department? newValue) {
                  setState(() {
                    _selectedDepartment = newValue!;
                  });
                },
                value: _selectedDepartment,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a department';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<Role>(
                decoration: InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
                items: _roles.map((Role role) {
                  return DropdownMenuItem<Role>(
                    value: role,
                    child: Text(role.roleName),
                  );
                }).toList(),
                onChanged: (Role? newValue) {
                  setState(() {
                    _selectedRole = newValue!;
                  });
                },
                value: _selectedRole,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Joining',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                validator: (value) {
                  if (_dateOfJoining == null) {
                    return 'Please select Date of Joining';
                  }
                  return null;
                },
                controller: TextEditingController(
                  text: _dateOfJoining == null ? '' : DateFormat('yyyy-MM-dd').format(_dateOfJoining!),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Salary',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Salary';
                  }
                  return null;
                },
                onSaved: (value) {
                  _salary = double.parse(value!);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _address = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addEmployee,
                child: Text('Add Employee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

