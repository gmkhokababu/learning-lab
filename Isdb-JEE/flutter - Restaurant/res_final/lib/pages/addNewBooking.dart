import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:res_final/pages/ip.dart';
import '../model/booking.dart';


List<Booking> objectsFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String objectsToJson(List<Booking> data) =>
    json.encode(List<Booking>.from(data.map((x) => x.toJson())));

class Addnewbooking extends StatefulWidget {
  const Addnewbooking({super.key});

  @override
  State<Addnewbooking> createState() => _AddnewbookingState();
}

class _AddnewbookingState extends State<Addnewbooking> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _customerName = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  int? _selectedTableNo;
  TimeOfDay? _selectedTime;
  final List<int> _tableOptions = [101, 102, 103, 104, 105, 106,107,108,109,110,111,112,113,114,115]; // Example table numbers

  Future<void> addBooking() async {
    if (_selectedTableNo == null || _selectedTime == null || _date.text.isEmpty || _customerName.text.isEmpty || _phone.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    Booking booking = Booking(
      tableNo: _selectedTableNo!,
      bookingTime: _selectedTime!.format(context), // Format time for the server
      date: _date.text,
      customerName: _customerName.text,
      phone: _phone.text,
    );

    Ip ip = Ip();
    final response = await http.post(
      Uri.parse('${ip.ipAddress}/newbooking2'),
      body: jsonEncode(booking.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking Successful")),
      );
      // Navigate to another page if needed
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${response.reasonPhrase}")),
      );
    }
  }

  Future<void> _selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        _date.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format date as YYYY-MM-DD
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Booking"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            _buildTableDropdown(),
            _buildDatePicker(),
            _buildTimePicker(),
            _buildTextField(_customerName, "Customer Name"),
            _buildTextField(_phone, "Phone", TextInputType.phone),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Book Now!"),
              onPressed: addBooking,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableDropdown() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DropdownButtonFormField<int>(
        value: _selectedTableNo,
        hint: Text("Select Table No"),
        items: _tableOptions.map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedTableNo = newValue;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: _date,
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Date",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        onTap: _selectDate,
      ),
    );
  }

  Widget _buildTimePicker() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: TextEditingController(text: _selectedTime?.format(context)),
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Time",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: Icon(Icons.access_time),
        ),
        onTap: _selectTime,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, [TextInputType inputType = TextInputType.text]) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        keyboardType: inputType,
      ),
    );
  }
}
