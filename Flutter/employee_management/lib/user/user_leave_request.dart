import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/employee.dart';
import 'package:employee_management/model/leave_request.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class UserLeaveRequestScreen extends StatefulWidget {
  @override
  _UserLeaveRequestScreenState createState() => _UserLeaveRequestScreenState();
}

class _UserLeaveRequestScreenState extends State<UserLeaveRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _fromDate;
  DateTime? _toDate;
  Employee? _selectedEmployee;
  List<Employee> _employees = [];

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }

  Future<void> _fetchEmployees() async {
    final url = '${Ipconfig().ip}all-employee';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _employees = data.map((e) => Employee.fromJson(e)).toList();
      });
    } else {
      throw Exception('Failed to load employees');
    }
  }

  Future<void> _submitLeaveRequest() async {
    if (_formKey.currentState!.validate() && _fromDate != null && _toDate != null && _selectedEmployee != null) {
      final leaveRequest = LeaveRequest(
        requestId: 0,
        fromDate: _fromDate!,
        toDate: _toDate!,
        requestDate: DateTime.now(),
        description: _descriptionController.text,
        status: 'requested',
        employeeId: _selectedEmployee!.employeeId!,
      );

      final url = '${Ipconfig().ip}leave-requests';
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'requestId': leaveRequest.requestId,
          'fromDate': _formatDate(leaveRequest.fromDate),
          'toDate': _formatDate(leaveRequest.toDate),
          'requestDate': _formatDate(leaveRequest.requestDate),
          'description': leaveRequest.description,
          'status': leaveRequest.status,
          'employeeId': leaveRequest.employeeId,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Leave request submitted successfully')),
        );
        Navigator.pop(context);  // Navigate back after successful submission
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit leave request')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Request'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropdownButtonFormField<Employee>(
                value: _selectedEmployee,
                hint: Text('Select Employee'),
                items: _employees.map((Employee employee) {
                  return DropdownMenuItem<Employee>(
                    value: employee,
                    child: Text('${employee.name} (${employee.departmentId})'),
                  );
                }).toList(),
                onChanged: (Employee? newValue) {
                  setState(() {
                    _selectedEmployee = newValue;
                  });
                },
                validator: (value) => value == null ? 'Please select an employee' : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              _buildDateField(
                labelText: 'Leave Start Date',
                selectedDate: _fromDate,
                onDateSelected: (date) => setState(() => _fromDate = date),
              ),
              _buildDateField(
                labelText: 'Leave End Date',
                selectedDate: _toDate,
                onDateSelected: (date) => setState(() => _toDate = date),
              ),
              _buildTextField(
                controller: _descriptionController,
                labelText: 'Description',
                hintText: 'Enter description',
                icon: Icons.description,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitLeaveRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField({
    required String labelText,
    DateTime? selectedDate,
    required void Function(DateTime) onDateSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            onDateSelected(pickedDate);
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: labelText,
              hintText: 'Select date',
              prefixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            controller: TextEditingController(
              text: selectedDate != null
                  ? _formatDate(selectedDate)
                  : '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select ${labelText.toLowerCase()}';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${labelText.toLowerCase()}';
          }
          return null;
        },
      ),
    );
  }
}
