import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/show_sales_reports.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/sale_report.dart';
import 'package:pharmacy_management/models/stock.dart'; // Import Stock model
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

List<SaleReport> objectsFromJson(String str) =>
    List<SaleReport>.from(json.decode(str).map((x) => SaleReport.fromJson(x)));

String objectsToJson(List<SaleReport> data) =>
    json.encode(List<SaleReport>.from(data.map((x) => x.toJson())));

class SalesReports extends StatefulWidget {
  const SalesReports({super.key});

  @override
  State<SalesReports> createState() => _SalesReportsState();
}

class _SalesReportsState extends State<SalesReports> {
  List<SaleReport> _saleReport = [];
  List<Stock> _stockData = [];
  List<String> _dropdownItems = [];
  String? _selectedDropdownItem;
  Ipconfig i = Ipconfig();
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  TextEditingController _type = TextEditingController();
  String? _selectedFilter;

  // Fetch stock data from API
  Future<void> fetchStockData() async {
    final response = await http.get(
      Uri.parse('${i.ip}get-all-stock-data'),
    );
    if (response.statusCode == 200) {
      setState(() {
        _stockData = List<Stock>.from(
            json.decode(response.body).map((x) => Stock.fromJson(x)));
      });
    } else {
      throw Exception("Failed to load stock data");
    }
  }

  Future<List<SaleReport>> saleReport() async {
    final response = await http.get(
      Uri.parse(
          '${i.ip}sale-report/${_startDate.text}/${_endDate.text}/${_type.text.isEmpty ? "null" : _type.text}'),
    );
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed to load Sales Report");
    }
  }

  Future<void> navigate(List<SaleReport> value) async {
    if (value.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShowSalesReports(saleReport: value)));
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStockData(); // Fetch stock data on initialization
  }

  // Method to handle data refresh
  Future<void> _refreshData() async {
    await fetchStockData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text(
          "Sales Report",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.teal, // AppBar color
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.teal[50], // Background color for fields
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _startDate,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Start Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onTap: () {
                            _selectDate(context, _startDate);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Date';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _endDate,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "End Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onTap: () {
                            _selectDate(context, _endDate);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'For use filter, select the category below; otherwise, leave it blank:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Medicine'),
                        value: 'Medicine',
                        groupValue: _selectedFilter,
                        onChanged: (value) {
                          setState(() {
                            _selectedFilter = value;
                            _dropdownItems = _stockData
                                .map((stock) => stock.medicineName!)
                                .toList();
                            _selectedDropdownItem = null;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Generic'),
                        value: 'Generic',
                        groupValue: _selectedFilter,
                        onChanged: (value) {
                          setState(() {
                            _selectedFilter = value;
                            _dropdownItems = _stockData
                                .map((stock) => stock.genericName!)
                                .toList();
                            _selectedDropdownItem = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Batch ID'),
                        value: 'BatchID',
                        groupValue: _selectedFilter,
                        onChanged: (value) {
                          setState(() {
                            _selectedFilter = value;
                            _dropdownItems = _stockData
                                .map((stock) => stock.batchId!)
                                .toList();
                            _selectedDropdownItem = null;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Supplier'),
                        value: 'Supplier',
                        groupValue: _selectedFilter,
                        onChanged: (value) {
                          setState(() {
                            _selectedFilter = value;
                            _dropdownItems = _stockData
                                .map((stock) => stock.supplier!)
                                .toList();
                            _selectedDropdownItem = null;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                if (_selectedFilter != null)
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: _selectedFilter,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    value: _selectedDropdownItem,
                    items: _dropdownItems
                        .map((item) => DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedDropdownItem = value;
                        _type.text = value!;
                      });
                    },
                  ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedFilter = null;
                        _dropdownItems.clear();
                        _selectedDropdownItem = null;
                        _type.clear();
                      });
                    },
                    child: Text("Clear Filters"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Button background color
                      foregroundColor: Colors.white, // Button text color
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        List<SaleReport> response = await saleReport();
                        await navigate(response);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to fetch data: $e")),
                        );
                      }
                    },
                    child: Text("Show Report"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Button background color
                      foregroundColor: Colors.white, // Button text color
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
