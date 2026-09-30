// services/api_service.dart

// ...imports and previous methods

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://192.168.137.1:8080/';

  // ... previous methods

  Future<Map<String, dynamic>> fetchAttendanceSummary() async {
    final response = await http.get(Uri.parse('${baseUrl}attendance-summary'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load attendance summary');
    }
  }

  Future<List<Map<String, dynamic>>> fetchAttendanceDetails() async {
    final response = await http.get(Uri.parse('${baseUrl}attendance-details'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => model as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load attendance details');
    }
  }

  Future<void> imposeSalary(Map<String, dynamic> salaryDetails) async {
    final response = await http.post(
      Uri.parse('${baseUrl}impose-salary'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(salaryDetails),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to impose salary');
    }
  }

  Future<List<Map<String, dynamic>>> fetchSalaryReport() async {
    final response = await http.get(Uri.parse('${baseUrl}salary-report'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((model) => model as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load salary report');
    }
  }
}
