// screens/salary_report.dart

import 'package:employee_management_2/service/api_service.dart';
import 'package:flutter/material.dart';


class SalaryReportScreen extends StatefulWidget {
  @override
  _SalaryReportScreenState createState() => _SalaryReportScreenState();
}

class _SalaryReportScreenState extends State<SalaryReportScreen> {
  final ApiService apiService = ApiService();
  late List<Map<String, dynamic>> salaryReport;

  @override
  void initState() {
    super.initState();
    fetchReport();
  }

  void fetchReport() async {
    try {
      salaryReport = await apiService.fetchSalaryReport();
      setState(() {});
    } catch (e) {
      print('Error fetching report: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Report'),
      ),
      body: ListView.builder(
        itemCount: salaryReport.length,
        itemBuilder: (context, index) {
          var report = salaryReport[index];
          return ListTile(
            title: Text('Employee ID: ${report['employeeId']}'),
            subtitle: Text('Total Salary: ${report['totalSalary']}'),
          );
        },
      ),
    );
  }
}
