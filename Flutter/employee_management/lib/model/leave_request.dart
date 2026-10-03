import 'dart:convert';

class LeaveRequest {
  int requestId;
  DateTime fromDate;
  DateTime toDate;
  DateTime requestDate;
  String description;
  String status;
  int employeeId;

  LeaveRequest({
    required this.requestId,
    required this.fromDate,
    required this.toDate,
    required this.requestDate,
    required this.description,
    required this.status,
    required this.employeeId,
  });

  factory LeaveRequest.fromJson(Map<String, dynamic> json) => LeaveRequest(
    requestId: json['requestId'],
    fromDate: DateTime.parse(json['fromDate']),
    toDate: DateTime.parse(json['toDate']),
    requestDate: DateTime.parse(json['requestDate']),
    description: json['description'],
    status: json['status'],
    employeeId: json['employeeId'],
  );

  Map<String, dynamic> toJson() {
    return {
      'requestId': requestId,
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'requestDate': requestDate.toIso8601String(),
      'description': description,
      'status': status,
      'employeeId': employeeId,
    };
  }
}
