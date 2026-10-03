import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/customer.dart';
import 'package:pharmacy_management/models/order.dart';
import 'package:pharmacy_management/models/pre_sale.dart';
import 'package:pharmacy_management/models/sale.dart';
import 'package:http/http.dart' as http;

class UserCartScreen extends StatefulWidget {
  final List<Order> sale;
  final List<PreSale> preSale;

  const UserCartScreen({super.key, required this.sale, required this.preSale});

  @override
  _UserCartScreenState createState() => _UserCartScreenState();
}

class _UserCartScreenState extends State<UserCartScreen> {
  Ipconfig ipConfig = Ipconfig();
  late List<Order> _sale;
  late List<PreSale> _preSale;
  late double _total;

  @override
  void initState() {
    super.initState();
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text(widget.preSale.length.toString())));
    _sale = widget.sale;
    _preSale = widget.preSale;
    _total = _preSale.fold(0, (sum, item) => sum + (item.total ?? 0.0));
  }

  Future<List<PreSale>> fetchPreSaleData() async {
    return _preSale;
  }

  Future<String> saveSale() async {
    final response = await http.post(
      Uri.parse('${ipConfig.ip}save-order'),
      body: jsonEncode(_sale),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Failed to save sale");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Total: \$$_total"),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () async {
                  await _showCustomerDetailsDialog();
                  String invoice = await saveSale();
                  if (invoice.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sale complete. Invoice no: $invoice")),
                    );
                  }
                  setState(() {
                    _sale.clear();
                    _preSale.clear();
                    _total = 0;
                  });
                },
                child: const Text("Confirm"),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<PreSale>>(
        future: fetchPreSaleData(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<PreSale> preSaleList = snapshot.data!;
            return ListView.builder(
              itemCount: preSaleList.length,
              itemBuilder: (context, index) {
                PreSale item = preSaleList[index];
                return ListTile(
                  leading: Text(item.medicineName?? "Unknown"),
                  trailing: Text("Price: ${item.rate} Qty: ${item.qty} Total: ${item.total}"),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _showCustomerDetailsDialog() async {
    final _nameController = TextEditingController();
    final _phoneNoController = TextEditingController();
    final _emailController = TextEditingController();
    final _addressController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Form(
              key: GlobalKey<FormState>(),
              child: Column(
                children: [
                  _buildTextField(_nameController, 'Name'),
                  _buildTextField(_phoneNoController, 'Phone No', maxLength: 11),
                  _buildTextField(_emailController, 'Email'),
                  _buildTextField(_addressController, 'Address'),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Customer customer = Customer(
                  customerId: 0,
                  name: _nameController.text,
                  phone: _phoneNoController.text,
                  email: _emailController.text,
                  address: _addressController.text,
                );

                final response = await http.post(
                  Uri.parse('${ipConfig.ip}add-customer'),
                  body: jsonEncode(customer.toJson()),
                  headers: {"Content-Type": "application/json"},
                );

                if (response.statusCode == 200) {
                  Customer newCustomer = Customer.fromJson(jsonDecode(response.body));
                  for (var sale in _sale) {
                    sale.customerId = newCustomer.customerId!;
                  }
                  Navigator.of(context).pop();
                } else {
                  throw Exception("Failed to add customer");
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int? maxLength}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      maxLength: maxLength,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}
