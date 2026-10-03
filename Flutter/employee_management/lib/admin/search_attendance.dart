// import 'package:employee_management/admin/attendance_report.dart';
// import 'package:employee_management/model/allattendancereport.dart';
// import 'package:employee_management/navigation/nav.dart';
// import 'package:flutter/material.dart';
//
// class SearchAttendance extends StatefulWidget {
//   const SearchAttendance({super.key});
//
//   @override
//   State<SearchAttendance> createState() => _SearchAttendanceState();
// }
//
// class _SearchAttendanceState extends State<SearchAttendance> {
//   String? year="select year";
//   String? month="select month";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Nav(),
//       appBar: AppBar(
//         title: Text("Search Attendance Report"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//           DropdownButton(
//             value: year,
//               items: <DropdownMenuItem<String>>[
//                 DropdownMenuItem<String>(
//                     child: Text("Select Year"),
//                   value: "select year",
//                 ),
//                 DropdownMenuItem<String>(
//                   child: Text("2023"),
//                   value: "2023",
//                 ),
//                 DropdownMenuItem<String>(
//                   child: Text("2024"),
//                   value: "2024",
//                 ),
//                 DropdownMenuItem<String>(
//                   child: Text("2025"),
//                   value: "2025",
//                 ),
//                 DropdownMenuItem<String>(
//                   child: Text("2026"),
//                   value: "2026",
//                 ),
//               ],
//               onChanged: (String? value){
//               setState(() {
//                 year=value;
//                 // Message(year.toString());
//               });
//               }
//           ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               DropdownButton(
//                   value: month,
//                   items: <DropdownMenuItem<String>>[
//                     DropdownMenuItem<String>(
//                       child: Text("Select Month"),
//                       value: "select month",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("January"),
//                       value: "jan",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("February"),
//                       value: "feb",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("March"),
//                       value: "mar",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("April"),
//                       value: "apr",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("May"),
//                       value: "may",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("June"),
//                       value: "jun",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("July"),
//                       value: "jul",
//                     ),DropdownMenuItem<String>(
//                       child: Text("August"),
//                       value: "aug",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("Septembor"),
//                       value: "sep",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("October"),
//                       value: "oct",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("November"),
//                       value: "nov",
//                     ),
//                     DropdownMenuItem<String>(
//                       child: Text("December"),
//                       value: "dec",
//                     ),
//                   ],
//                   onChanged: (String? value){
//                     setState(() {
//                       month=value;
//                       // Message(year.toString());
//                     });
//                   }
//               ),
//             ],
//           ),
//           ElevatedButton(
//               onPressed: (){
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                     builder: (context) => AttendanceReport(year: year,month: month,)));
//               },
//               child: Text("Search Report"),
//           )
//         ],
//       ),
//     );
//   }
// }

// screens/search_attendance.dart
import 'package:employee_management/admin/attendance_report.dart';
import 'package:employee_management/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Ensure this import is included for DateFormat


class SearchAttendance extends StatefulWidget {
  const SearchAttendance({super.key});

  @override
  State<SearchAttendance> createState() => _SearchAttendanceState();
}

class _SearchAttendanceState extends State<SearchAttendance> {
  DateTime? _selectedYear;
  DateTime? _selectedMonth;

  Future<void> _pickYear(BuildContext context) async {
    int? pickedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return YearPickerDialog(initialYear: _selectedYear?.year ?? DateTime.now().year);
      },
    );
    if (pickedYear != null) {
      setState(() {
        _selectedYear = DateTime(pickedYear);
        _selectedMonth = null; // Reset month when year changes
      });
    }
  }

  Future<void> _pickMonth(BuildContext context) async {
    if (_selectedYear == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a year first')),
      );
      return;
    }

    int? pickedMonth = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return MonthPickerDialog(
          initialMonth: _selectedMonth?.month ?? DateTime.now().month,
          year: _selectedYear!.year,
        );
      },
    );
    if (pickedMonth != null) {
      setState(() {
        _selectedMonth = DateTime(_selectedYear!.year, pickedMonth);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text("Search Attendance Report"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body:Column(
    mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Year Picker
                TextButton(
                  onPressed: () => _pickYear(context),
                  child: Text(
                    _selectedYear == null
                        ? "Select Year"
                        : DateFormat('yyyy').format(_selectedYear!),
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),

                // Month Picker
                TextButton(
                  onPressed: () => _pickMonth(context),
                  child: Text(
                    _selectedMonth == null
                        ? "Select Month"
                        : DateFormat('MMMM').format(_selectedMonth!),
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceReport(
                          year: _selectedYear != null ? DateFormat('yyyy').format(_selectedYear!) : null,
                          month: _selectedMonth != null ? DateFormat('MMM').format(_selectedMonth!).toLowerCase() : null,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Use backgroundColor instead of primary
                  ),
                  child: Text("Search Report"),
                ),
              ],
            ),
          ),
        ],
      )
      ]
    ),

    );
  }
}

class YearPickerDialog extends StatelessWidget {
  final int initialYear;

  YearPickerDialog({required this.initialYear});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Year'),
      content: Container(
        height: 300,
        width: 300,
        child: YearPicker(
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          initialDate: DateTime(initialYear),
          selectedDate: DateTime(initialYear),
          onChanged: (DateTime dateTime) {
            Navigator.pop(context, dateTime.year);
          },
        ),
      ),
    );
  }
}

class MonthPickerDialog extends StatelessWidget {
  final int initialMonth;
  final int year;

  MonthPickerDialog({required this.initialMonth, required this.year});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Month'),
      content: Container(
        height: 300,
        width: 300,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, index + 1);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(2.0),
                // padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: initialMonth == (index + 1) ? Colors.blueAccent : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  DateFormat.MMMM().format(DateTime(year, index + 1)),
                  style: TextStyle(
                    color: initialMonth == (index + 1) ? Colors.blueAccent : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
