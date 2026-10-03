import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/leave_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class AdminLeaveRequestScreen extends StatefulWidget {
  @override
  _AdminLeaveRequestScreenState createState() => _AdminLeaveRequestScreenState();
}

class _AdminLeaveRequestScreenState extends State<AdminLeaveRequestScreen> {
  List<LeaveRequest> _leaveRequests = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchLeaveRequests();
  }

  Future<void> _fetchLeaveRequests() async {
    try {
      final url = '${Ipconfig().ip}allrequestleave';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _leaveRequests = data.map((e) => LeaveRequest.fromJson(e)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load leave requests');
      }
    } catch (error) {
      _showErrorDialog('Failed to load leave requests: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateLeaveRequestStatus(int requestId, String status) async {
    try {
      final url = '${Ipconfig().ip}rejectLeave/$requestId/$status';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          _leaveRequests = _leaveRequests.map((leaveRequest) {
            if (leaveRequest.requestId == requestId) {
              leaveRequest.status = status;
            }
            return leaveRequest;
          }).toList();
        });
        _showSuccessDialog('Leave request $status successfully');
      } else {
        throw Exception('Failed to update leave request status');
      }
    } catch (error) {
      _showErrorDialog('Failed to update leave request status: $error');
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _showLeaveRequestDetails(LeaveRequest leaveRequest) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Leave Request Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Request ID: ${leaveRequest.requestId}'),
              Text('Employee ID: ${leaveRequest.employeeId}'),
              Text('From: ${_formatDate(leaveRequest.fromDate)}'),
              Text('To: ${_formatDate(leaveRequest.toDate)}'),
              Text('Request Date: ${_formatDate(leaveRequest.requestDate)}'),
              Text('Description: ${leaveRequest.description}'),
              Text('Status: ${leaveRequest.status}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _updateLeaveRequestStatus(leaveRequest.requestId, 'accepted');
              },
              child: Text('Accept'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _updateLeaveRequestStatus(leaveRequest.requestId, 'rejected');
              },
              child: Text('Reject'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Leave Requests'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _leaveRequests.isEmpty
          ? Center(child: Text('No leave request'))
          : ListView.builder(
        itemCount: _leaveRequests.length,
        itemBuilder: (context, index) {
          final leaveRequest = _leaveRequests[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Employee ID: ${leaveRequest.employeeId}'),
              subtitle: Text(
                'From: ${_formatDate(leaveRequest.fromDate)}\nTo: ${_formatDate(leaveRequest.toDate)}',
              ),
              onTap: () => _showLeaveRequestDetails(leaveRequest),
            ),
          );
        },
      ),
    );
  }
}
