// services/api_service.dart
import 'package:employee_management/model/department.dart';
import 'package:employee_management/model/role.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Department>> fetchDepartments() async {
    final response = await http.get(Uri.parse('$baseUrl/departments'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((dept) => Department.fromJson(dept)).toList();
    } else {
      throw Exception('Failed to load departments');
    }
  }

  Future<List<Role>> fetchRoles() async {
    final response = await http.get(Uri.parse('$baseUrl/roles'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((role) => Role.fromJson(role)).toList();
    } else {
      throw Exception('Failed to load roles');
    }
  }
}
