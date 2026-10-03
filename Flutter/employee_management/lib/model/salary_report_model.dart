class SalaryReportModel {
  int id;
  int employeeId;
  double basic;
  double house;
  double communication;
  double transport;
  double medical;
  int present;
  int absent;
  int leave;
  int totalAbsent;
  double leaveNotPay;
  double bonous;
  double total;
  String month;
  int year;
  DateTime emposeDate;
  String employeeName;

  SalaryReportModel({
    required this.id,
    required this.employeeId,
    required this.basic,
    required this.house,
    required this.communication,
    required this.transport,
    required this.medical,
    required this.present,
    required this.absent,
    required this.leave,
    required this.totalAbsent,
    required this.leaveNotPay,
    required this.bonous,
    required this.total,
    required this.month,
    required this.year,
    required this.emposeDate,
    required this.employeeName,
  });

  factory SalaryReportModel.fromJson(Map<String, dynamic> json) {
    return SalaryReportModel(
      id: json['id'],
      employeeId: json['employeeId'],
      basic: json['basic'],
      house: json['house'],
      communication: json['communication'],
      transport: json['transport'],
      medical: json['medical'],
      present: json['present'],
      absent: json['absent'],
      leave: json['leave'],
      totalAbsent: json['totalAbsent'],
      leaveNotPay: json['leaveNotPay'],
      bonous: json['bonous'],
      total: json['total'],
      month: json['month'],
      year: json['year'],
      emposeDate: DateTime.parse(json['emposeDate']),
      employeeName: json['employeeName'],
    );
  }
}
