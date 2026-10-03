import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/leave_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class UserLeaveRequestStatusScreen extends StatefulWidget {
  @override
  _UserLeaveRequestStatusScreenState createState() => _UserLeaveRequestStatusScreenState();
}

class _UserLeaveRequestStatusScreenState extends State<UserLeaveRequestStatusScreen> {
  List<LeaveRequest> _leaveRequests = [];

  @override
  void initState() {
    super.initState();
    _fetchLeaveRequests();
  }

  Future<void> _fetchLeaveRequests() async {
    final url = '${Ipconfig().ip}allrequestleavestatus';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _leaveRequests = data.map((e) => LeaveRequest.fromJson(e)).toList();
      });
    } else {
      throw Exception('Failed to load leave requests');
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MMM-dd').format(date).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Request Status'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _leaveRequests.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _leaveRequests.length,
        itemBuilder: (context, index) {
          final leaveRequest = _leaveRequests[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Request ID: ${leaveRequest.requestId}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Employee ID: ${leaveRequest.employeeId}'),
                  Text('From: ${_formatDate(leaveRequest.fromDate)}'),
                  Text('To: ${_formatDate(leaveRequest.toDate)}'),
                  Text('Request Date: ${_formatDate(leaveRequest.requestDate)}'),
                  Text('Description: ${leaveRequest.description}'),
                  Text('Status: ${leaveRequest.status}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
