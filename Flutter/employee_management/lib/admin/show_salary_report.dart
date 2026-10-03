import 'package:employee_management/admin/salary_report.dart';
import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/salary_report_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';



class ShowSalaryReport extends StatefulWidget {
  final String? year;
  final String? month;

  ShowSalaryReport({required this.year, required this.month});

  @override
  _ShowSalaryReportState createState() => _ShowSalaryReportState();
}

class _ShowSalaryReportState extends State<ShowSalaryReport> {
  late Future<List<SalaryReportModel>> salaryReports;

  @override
  void initState() {
    super.initState();
    salaryReports = fetchSalaryReports(widget.month!, widget.year!);
  }

  Future<List<SalaryReportModel>> fetchSalaryReports(String month, String year) async {
    final response = await http.get(Uri.parse('${Ipconfig().ip}salarybymonthyear/$month/$year'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => SalaryReportModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load salary reports');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Report for ${widget.month} ${widget.year}'),
      ),
      body: FutureBuilder<List<SalaryReportModel>>(
        future: salaryReports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var report = snapshot.data![index];
                return ListTile(
                  title: Text(report.employeeName),
                  subtitle: Text('Total Salary: ${report.total}'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Salary Details for ${report.employeeName}'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Basic: ${report.basic}'),
                                Text('House: ${report.house}'),
                                Text('Communication: ${report.communication}'),
                                Text('Transport: ${report.transport}'),
                                Text('Medical: ${report.medical}'),
                                Text('Present: ${report.present}'),
                                Text('Absent: ${report.absent}'),
                                Text('Leave: ${report.leave}'),
                                Text('Total Absent: ${report.totalAbsent}'),
                                Text('Leave Not Pay: ${report.leaveNotPay}'),
                                Text('Bonous: ${report.bonous}'),
                                Text('Total: ${report.total}'),
                                Text('Month: ${report.month}'),
                                Text('Year: ${report.year}'),
                                Text('Impose Date: ${DateFormat('yyyy-MM-dd').format(report.emposeDate)}'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
