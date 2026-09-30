import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/navigation/nav.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'show_salary_report.dart';



class SalaryReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Salary Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCardButton(context, 'Salary Impose', Icons.attach_money, () {
              _showSalaryImposeDialog(context);
            }),
            SizedBox(height: 20),
            _buildCardButton(context, 'Salary Report', Icons.report, () {
              _showSalaryReportDialog(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCardButton(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.blueAccent),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSalaryImposeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Impose Salary'),
          content: SalaryImposeForm(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showSalaryReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Salary Report'),
          content: SalaryReportForm(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class SalaryImposeForm extends StatefulWidget {
  @override
  _SalaryImposeFormState createState() => _SalaryImposeFormState();
}

class _SalaryImposeFormState extends State<SalaryImposeForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedYear;
  DateTime? _selectedMonth;
  DateTime? _selectedDate;

  Future<void> _imposeSalary() async {
    if (_formKey.currentState!.validate()) {
      String year = DateFormat('yyyy').format(_selectedYear!);
      String month = DateFormat('MMM').format(_selectedMonth!);
      String date = DateFormat('yyyy-MM-dd').format(_selectedDate!);

      String url = '${Ipconfig().ip}salary/$month/$year/$date';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Salary imposed for ${DateFormat('MMMM').format(_selectedMonth!)} $year')),
        );
        Navigator.of(context).pop(); // Close the dialog after imposing salary
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to impose salary')),
        );
      }
    }
  }

  void _pickYear(BuildContext context) async {
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

  void _pickMonth(BuildContext context) async {
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

  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      helpText: 'Select Impose Date',
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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

            // Impose Date Picker
            TextFormField(
              decoration: InputDecoration(labelText: 'Impose Date'),
              keyboardType: TextInputType.datetime,
              onTap: () => _pickDate(context),
              readOnly: true,
              controller: TextEditingController(
                text: _selectedDate == null
                    ? ""
                    : DateFormat('yyyy-MM-dd').format(_selectedDate!),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an impose date';
                }
                return null;
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _imposeSalary,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Use backgroundColor instead of primary
              ),
              child: Text("Impose Salary"),
            ),
          ],
        ),
      ),
    );
  }
}

class SalaryReportForm extends StatefulWidget {
  @override
  _SalaryReportFormState createState() => _SalaryReportFormState();
}

class _SalaryReportFormState extends State<SalaryReportForm> {
  DateTime? _selectedYear;
  DateTime? _selectedMonth;

  void _pickYear(BuildContext context) async {
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

  void _pickMonth(BuildContext context) async {
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

  void _showSalaryReport(BuildContext context) {
    if (_selectedYear != null && _selectedMonth != null) {
      String year = DateFormat('yyyy').format(_selectedYear!);
      String month = DateFormat('MMM').format(_selectedMonth!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowSalaryReport(
            year: year,
            month: month,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both year and month')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                  : DateFormat('MMM').format(_selectedMonth!),
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => _showSalaryReport(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Use backgroundColor instead of primary
            ),
            child: Text("Show Salary Report"),
          ),
        ],
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
                decoration: BoxDecoration(
                  border: Border.all(
                    color: initialMonth == (index + 1) ? Colors.blueAccent : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  DateFormat.MMM().format(DateTime(year, index + 1)),
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
