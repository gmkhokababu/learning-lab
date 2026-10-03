class ShortAttendanceReport{
  int? attendanceId;
  String? name;
  int? absent;
  int? present;
  int? leave;
  ShortAttendanceReport({
    required this.attendanceId,
    required this.name,
    required this.absent,
    required this.present,
    required this.leave,
  });
}