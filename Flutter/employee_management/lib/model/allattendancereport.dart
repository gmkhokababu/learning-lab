class Allattendancereport{
  int? attendanceId;
  String? employeename;
  String? month;
  String? year;
  String? a01;
  String? a02;
  String? a03;
  String? a04;
  String? a05;
  String? a06;
  String? a07;
  String? a08;
  String? a09;
  String? a10;
  String? a11;
  String? a12;
  String? a13;
  String? a14;
  String? a15;
  String? a16;
  String? a17;
  String? a18;
  String? a19;
  String? a20;
  String? a21;
  String? a22;
  String? a23;
  String? a24;
  String? a25;
  String? a26;
  String? a27;
  String? a28;
  String? a29;
  String? a30;
  String? a31;
  Allattendancereport({
    required this.attendanceId,
    required this.employeename,
    required this.month,
    required this.year,
    required this.a01,
    required this.a02,
    required this.a03,
    required this. a04,
    required this.a05,
    required this.a06,
    required this.a07,
    required this.a08,
    required this.a09,
    required this.a10,
    required this. a11,
    required this.a12,
    required this. a13,
    required this. a14,
    required this.a15,
    required this. a16,
    required this.a17,
    required this.a18,
    required this.a19,
    required this. a20,
    required this.a21,
    required this. a22,
    required this.a23,
    required this.a24,
    required this. a25,
    required this. a26,
    required this.a27,
    required this.a28,
    required this.a29,
    required this. a30,
    required this. a31,
  });
  factory Allattendancereport.fromJson(Map<String, dynamic> json) => Allattendancereport(
    attendanceId: json['attendanceId'],
    employeename: json['employeename'],
    month: json['month'],
    year: json['year'],
    a01: json['a01'],
    a02: json['a02'],
    a03: json['a03'],
    a04: json['a04'],
    a05: json['a05'],
    a06: json['a06'],
    a07: json['a07'],
    a08: json['a08'],
    a09: json['a09'],
    a10: json['a10'],
    a11: json['a11'],
    a12: json['a12'],
    a13: json['a13'],
    a14: json['a14'],
    a15: json['a15'],
    a16: json['a16'],
    a17: json['a17'],
    a18: json['a18'],
    a19: json['a19'],
    a20: json['a20'],
    a21: json['a21'],
    a22: json['a22'],
    a23: json['a23'],
    a24: json['a24'],
    a25: json['a25'],
    a26: json['a26'],
    a27: json['a27'],
    a28: json['a28'],
    a29: json['a29'],
    a30: json['a30'],
    a31: json['a31'],

  );
  Map<String, dynamic> toJson() {
    return {
      "attendanceId": attendanceId,
      "employeename": employeename,
      "month": month,
      "year": year,
      "a01": a01,
      "a02": a02,
      "a03": a03,
      "a04": a04,
      "a05": a05,
      "a06": a06,
      "a07": a07,
      "a08": a08,
      "a09": a09,
      "a10": a10,
      "a11": a11,
      "a12": a12,
      "a13": a13,
      "a14": a14,
      "a15": a15,
      "a16": a16,
      "a17": a17,
      "a18": a18,
      "a19": a19,
      "a20": a20,
      "a21": a21,
      "a22": a22,
      "a23": a23,
      "a24": a24,
      "a25": a25,
      "a26": a26,
      "a27": a27,
      "a28": a28,
      "a29": a29,
      "a30": a30,
      "a31": a31,

    };
  }
  int countTotalPresent() {
    int count = 0;
    for (var i = 1; i <= 35; i++) {
      var day = this._getDay(i);
      if (day == 'P') count++;
    }
    return count;
  }

  int countTotalAbsent() {
    int count = 0;
    for (var i = 1; i <= 35; i++) {
      var day = this._getDay(i);
      if (day == 'A') count++;
    }
    return count;
  }

  int countTotalLeave() {
    int count = 0;
    for (var i = 1; i <= 35; i++) {
      var day = this._getDay(i);
      if (day == 'L') count++;
    }
    return count;
  }

  String? _getDay(int day) {
    switch (day) {
      case 1: return a01;
      case 2: return a02;
      case 3: return a03;
      case 4: return a04;
      case 5: return a05;
      case 6: return a06;
      case 7: return a07;
      case 8: return a08;
      case 9: return a09;
      case 10: return a10;
      case 11: return a11;
      case 12: return a12;
      case 13: return a13;
      case 14: return a14;
      case 15: return a15;
      case 16: return a16;
      case 17: return a17;
      case 18: return a18;
      case 19: return a19;
      case 20: return a20;
      case 21: return a21;
      case 22: return a22;
      case 23: return a23;
      case 24: return a24;
      case 25: return a25;
      case 26: return a26;
      case 27: return a27;
      case 28: return a28;
      case 29: return a29;
      case 30: return a30;
      case 31: return a31;
      default: return null;
    }
  }

}