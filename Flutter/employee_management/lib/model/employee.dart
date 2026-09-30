// class Employee{
//   int? employeeId;
//   String? name;
//   String? email;
//   String? phoneNo;
//   int? departmentId;
//   int? roleId;
//   String? dateOfJoining;
//   double? salary;
//   String? address;
//   String? attendancestatus;
//
//   Employee({
//     required this.employeeId,
//     required this.name,
//     required this.email,
//     required this.phoneNo,
//     required this.departmentId,
//     required this.roleId,
//     required this.dateOfJoining,
//     required this.salary,
//     required this.address,
//     required this.attendancestatus,
//   });
//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//     employeeId: json['employeeId'],
//     name: json['name'],
//     email: json['email'],
//     phoneNo: json['phoneNo'],
//     departmentId: json['departmentId'],
//     roleId: json['roleId'],
//     dateOfJoining: json['dateOfJoining'],
//     salary: json['salary'],
//     address: json['address'],
//     attendancestatus: json['attendancestatus'],
//
//   );
//   Map<String, dynamic> toJson() {
//     return {
//       "employeeId": employeeId,
//       "name": name,
//       "email": email,
//       "phoneNo": phoneNo,
//       "departmentId": departmentId,
//       "userId": roleId,
//       "dateOfJoining": dateOfJoining,
//       "salary": salary,
//       "address": address,
//       "attendancestatus": attendancestatus,
//     };
//   }
// }

import 'dart:convert'; // Required for JSON encoding and decoding

import 'dart:convert';

class Employee {
  int? employeeId;
  String name;
  String email;
  String phoneNo;
  int departmentId;
  int roleId;
  DateTime dateOfJoining;
  double salary;
  String address;
  // String attendancestatus;

  Employee({
    this.employeeId,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.departmentId,
    required this.roleId,
    required this.dateOfJoining,
    required this.salary,
    required this.address,
    // required this.attendancestatus,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    employeeId: json['employeeId'],
    name: json['name'],
    email: json['email'],
    phoneNo: json['phoneNo'],
    departmentId: json['departmentId'],
    roleId: json['roleId'],
    dateOfJoining: DateTime.parse(json['dateOfJoining']),
    salary: json['salary'].toDouble(),
    address: json['address'],
    // attendancestatus: json['attendancestatus'],
  );

  Map<String, dynamic> toJson() {
    return {
      "employeeId": employeeId,
      "name": name,
      "email": email,
      "phoneNo": phoneNo,
      "departmentId": departmentId,
      "roleId": roleId,
      "dateOfJoining": dateOfJoining.toIso8601String(),
      "salary": salary,
      "address": address,
      // "attendancestatus": attendancestatus,
    };
  }
}

