import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/voucher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddVoucherScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _voucherHeadController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Voucher'),
        backgroundColor: Colors.blueAccent, // AppBar color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTextField(
                controller: _voucherHeadController,
                labelText: 'Voucher Head',
                hintText: 'Enter voucher head',
                icon: Icons.text_fields,
              ),
              _buildTextField(
                controller: _descriptionController,
                labelText: 'Description',
                hintText: 'Enter description',
                icon: Icons.description,
                maxLines: 5, // Increased height for description box
              ),
              _buildTextField(
                controller: _amountController,
                labelText: 'Amount',
                hintText: 'Enter amount',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitVoucher(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Button color
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
          if (labelText == 'Amount' && double.tryParse(value) == null) {
            return 'Please enter a valid amount';
          }
          return null;
        },
      ),
    );
  }

  Future<void> _submitVoucher(BuildContext context) async {
    // Close the keyboard
    FocusScope.of(context).unfocus();

    final voucher = Voucher(
      voucherNumber: 0,
      heading: _voucherHeadController.text,
      description: _descriptionController.text,
      ammount: double.parse(_amountController.text),
      status: 'requested',
      requesterId: 0,
    );

    final url = '${Ipconfig().ip}saveVoucher';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(voucher.toJson()),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Voucher submitted successfully')),
      );
      Navigator.pushNamed(context, '/showVoucherStatus'); // Navigate to Show Voucher Status page
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit voucher')),
      );
    }
  }
}
