import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_management/extension/date_format.dart';
import 'package:pharmacy_management/extension/string_extension.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/order.dart';
import 'package:pharmacy_management/models/pre_sale.dart';
import 'package:pharmacy_management/models/stock.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_management/navigation/user_nav.dart';
import 'package:pharmacy_management/user/user_cart_screen.dart';

List<Stock> objectsFromJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));
String objectsToJson(List<Stock> data) =>
    json.encode(List<Stock>.from(data.map((x) => x.toJson())));

class UserOrderScreen extends StatefulWidget {
  const UserOrderScreen({super.key});

  @override
  State<UserOrderScreen> createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  final TextEditingController orderqtyController = TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = GlobalKey<FormState>();

  Ipconfig i = Ipconfig();
  late List<Stock> _stock = [];
  List<Order> _orders = [];
  List<PreSale> _preSale = [];
  Order order = Order(
      orderId: 0,
      stockId: 0,
      qty: 0,
      rate: 0.0,
      total: 0.0,
      saleDate: DateTime.now(),
      customerId: 0,
      invoiceNo: null,
      status: "");
  PreSale preSale = PreSale(
      stockId: 0, medicineName: "", qty: 0, rate: 0, total: 0);

  //===========================future method============
  Future<List<Stock>> allStock() async {
    try {
      final response = await http.get(
        Uri.parse('${i.ip}get-all-stock-data'),
      );
      if (response.statusCode == 200) {
        return objectsFromJson(response.body);
      } else {
        throw Exception("Failed to load stock data");
      }
    } catch (e) {
      throw Exception("Error fetching stock data: $e");
    }
  }
  //==========================future method end=================

  @override
  void initState() {
    super.initState();
    _fetchStockData();
  }

  void _fetchStockData() async {
    try {
      List<Stock> stocks = await allStock();
      setState(() {
        _stock = stocks;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error loading stock data: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNav(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserCartScreen(
                          sale: _orders,
                          preSale: _preSale,
                        )));
              },
              child: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Stock>>(
        future: allStock(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data != null) {
            _stock = snapshot.data!;
            return ListView.builder(
              itemCount: _stock.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(_stock[index].medicineName?.capitalize() ?? "Unknown"),
                      leading: Text(_stock[index].qty?.toString() ?? "0"),
                      trailing: Text(_stock[index].rate?.toString() ?? "0.0"),
                      onTap: () async {
                        try {
                          await showTitleDialog();

                          DateTime now = DateTime.now();
                          String date = DateFormat(date: now).format().toString();
                          bool checked = false;

                          for (var i = 0; i < _orders.length; i++) {
                            if (_orders[i].stockId == _stock[index].stockId) {
                              _orders[i].qty = (_orders[i].qty ?? 0) + (int.tryParse(orderqtyController.text) ?? 0);
                              _orders[i].total = (_orders[i].rate ?? 0.0) * (_orders[i].qty ?? 0);
                              checked = true;
                            }
                          }
                          if (!checked) {
                            double rate = _stock[index].rate ?? 0.0;
                            int qty = int.tryParse(orderqtyController.text) ?? 0;
                            double total = rate * qty;
                            order = Order(
                                orderId: 0,
                                stockId: _stock[index].stockId ?? 0,
                                qty: qty,
                                rate: rate,
                                total: total,
                                saleDate: DateTime.parse(date),
                                customerId: 0,
                                invoiceNo: null,
                                status: "Requested");
                            _orders.add(order);
                          }
                          checked = false;
                          for (var i = 0; i < _preSale.length; i++) {
                            if (_preSale[i].stockId == _stock[index].stockId) {
                              var total = _stock[index].rate! * int.parse(orderqtyController.text);
                              _preSale[i].qty = _preSale[i].qty! + int.parse(orderqtyController.text);
                              _preSale[i].total = _preSale[i].total! + total;
                              checked = true;
                            }
                          }
                          if (!checked) {
                            var total = _stock[index].rate! * int.parse(orderqtyController.text);
                            preSale = PreSale(
                                stockId: _stock[index].stockId,
                                medicineName: _stock[index].medicineName,
                                qty: int.parse(orderqtyController.text),
                                rate: _stock[index].rate,
                                total: total);
                            _preSale.add(preSale);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text("Item Added")));
                            orderqtyController.text="";
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Total: ${_orders.map((o) => o.total).reduce((a, b) => a! + b!).toString()}')));
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Error processing order: $e')));
                        }
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text("No stock data available"));
          }
        },
      ),
    );
  }

  Future showTitleDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Form(
            key: _keyDialogForm,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: orderqtyController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Order Quantity',
                  ),
                  maxLength: 8,
                  textAlign: TextAlign.center,
                  onSaved: (val){
                    setState(() {});
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Quantity';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Enter a valid number';
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (_keyDialogForm.currentState!.validate()) {
                  _keyDialogForm.currentState!.save();
                  Navigator.pop(context);
                }
              },
              child: Text('Ok'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
