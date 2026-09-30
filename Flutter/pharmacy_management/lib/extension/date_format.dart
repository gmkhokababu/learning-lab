import 'package:flutter/material.dart';

class DateFormat{
  DateTime? date;
  String? result;
  format(){
    String day=date!.day.toString();
    String month=date!.month.toString();
    if (int.parse(day) < 10 && int.parse(month)< 10) {
      result = date!.year.toString() + "-" + "0" + month + "-" + "0" + day;
    } else if (int.parse(day) < 10) {
      result = date!.year.toString() + "-" + month + "-" + "0" + day;
    } else if (int.parse(month) < 10) {
      result = date!.year.toString() + "-" + "0" + month + "-" + day;
    } else {
      result = date!.year.toString() + "-" + month + "-" + day;
    }
    return result;
  }
  DateFormat({
    required this.date
  });
}