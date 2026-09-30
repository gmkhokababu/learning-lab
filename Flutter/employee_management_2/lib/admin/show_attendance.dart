// screens/show_attendance.dart

import 'package:employee_management_2/service/api_service.dart';
import 'package:flutter/material.dart';


class ShowAttendanceScreen extends StatefulWidget {
  @override
  _ShowAttendanceScreenState createState() => _ShowAttendanceScreenState();
}

class _ShowAttendanceScreenState extends State<ShowAttendanceScreen> {
  final ApiService apiService = ApiService();
  late Map<String, dynamic> summary;
  late List<Map<String, dynamic>> details;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      summary = await apiService.fetchAttendanceSummary();
      details = await apiService.fetchAttendanceDetails();
      setState(() {});
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Total Present: ${summary['totalPresent'] ?? 'N/A'}'),
              subtitle: Text('Total Absent: ${summary['totalAbsent'] ?? 'N/A'}'),
            ),
            ListTile(
              title: Text('Total Leave: ${summary['totalLeave'] ?? 'N/A'}'),
            ),
            Divider(),
            if (details.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: details.length,
                itemBuilder: (context, index) {
                  var detail = details[index];
                  return ListTile(
                    title: Text(detail['date'] ?? ''),
                    subtitle: Text('Status: ${detail['status'] ?? ''}'),
                  );
                },
              ),
            if (details.isEmpty)
              Center(
                child: Text('No attendance details available.'),
              ),
          ],
        ),
      ),
    );
  }
}
