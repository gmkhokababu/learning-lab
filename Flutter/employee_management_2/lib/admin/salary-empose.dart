// screens/salary_impose.dart

import 'package:employee_management_2/service/api_service.dart';
import 'package:flutter/material.dart';


class SalaryImposeScreen extends StatefulWidget {
  @override
  _SalaryImposeScreenState createState() => _SalaryImposeScreenState();
}

class _SalaryImposeScreenState extends State<SalaryImposeScreen> {
  final ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  String? employeeId, basic, house, communication, transport, medical;
  late DateTime emposeDate;

  @override
  void initState() {
    super.initState();
    emposeDate = DateTime.now();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Map<String, dynamic> salaryDetails = {
        'employeeId': employeeId,
        'basic': basic,
        'house': house,
        'communication': communication,
        'transport': transport,
        'medical': medical,
        'emposeDate': emposeDate.toIso8601String(),
      };

      try {
        await apiService.imposeSalary(salaryDetails);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Salary imposed successfully')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to impose salary')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impose Salary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Employee ID'),
                validator: (value) => value!.isEmpty ? 'Enter employee ID' : null,
                onSaved: (value) => employeeId = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Basic Salary'),
                validator: (value) => value!.isEmpty ? 'Enter basic salary' : null,
                onSaved: (value) => basic = value,
              ),
              // Add other salary components
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Impose Salary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
