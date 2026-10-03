import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmacy_management/admin/cart.dart';
import 'package:pharmacy_management/extension/date_format.dart';
import 'package:pharmacy_management/extension/string_extension.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/pre_sale.dart';
import 'package:pharmacy_management/models/sale.dart';
import 'package:pharmacy_management/models/stock.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

List<Stock> objectsFromJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));
String objectsToJson(List<Stock> data) =>
    json.encode(List<Stock>.from(data.map((x) => x.toJson())));

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  final TextEditingController orderqty = TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();

  int? orderQuantity;
  Ipconfig i = Ipconfig();
  late List<Stock> _stock = [];
  String? medicineName = "Select Medicine Name";
  List<Sale> _sale = [];
  List<PreSale> _preSale = [];
  Sale sale = Sale(
      saleId: 0,
      stockId: 0,
      qty: 0,
      rate: 0,
      total: 0,
      saleDate: "",
      customerId: 0,
      invoice_no: "");
  PreSale preSale =
      PreSale(stockId: 0, medicineName: "", qty: 0, rate: 0, total: 0);
  //===========================future method============
  Future<List<Stock>> allstock() async {
    final response = await http.get(
      Uri.parse('${i.ip}get-all-stock-data'),
    );
    if (response.statusCode == 200) {
      // SnackBar s = SnackBar(content: Text("Get Data"));
      // ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    } else {
      throw Exception(
          "Failed to load employees"); // Changed exception message to be more descriptive
    }
  }
//==========================future method end=================

  @override
  void initState() {
    allstock();
    // messege();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Cart(
                              sale: _sale,
                              preSale: _preSale,
                            )));
              },
              child: Icon(Icons.shopping_cart),
              // style: ,
            )
          ],
        ),
      ),
      body: FutureBuilder<List<Stock>>(
        future: allstock(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Added connectionState check
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text("Error: ${snapshot.error}")); // Improved error message
          } else if (snapshot.hasData && snapshot.data != null) {
            // Added null check for data
            _stock = snapshot.data!;
            // Initialize counters
            return ListView.builder(
              itemCount: _stock.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  ListTile(
                      title: Text(
                          _stock[index].medicineName.toString().capitalize()),
                      // title: Text(_employees[index].name.toString().capitalize()),
                      leading: Text(_stock[index].qty.toString().capitalize()),
                      // subtitle: Text("${_employees[index].email.toString().toLowerCase()} ${_employees[index].phoneNo.toString().toLowerCase()}"),
                      trailing: Text(_stock[index].rate.toString()),
                      onTap: () async {
                        await showTitleDialog();
                        DateTime now = DateTime.now();
                        String? date =
                            DateFormat(date: now).format().toString();
                        var checked = false;
                        for (var i = 0; i < _sale.length; i++) {
                          if (_sale[i].stockId == _stock[index].stockId) {
                            _sale[i].qty =
                                _sale[i].qty! + int.parse(orderqty.text);
                            _sale[i].total = _sale[i].total! +
                                (_stock[index].rate! *
                                    int.parse(orderqty.text));
                            checked = true;
                          }
                        }
                        if (checked != true) {
                          var total =
                              _stock[index].rate! * int.parse(orderqty.text);
                          sale = Sale(
                              saleId: 0,
                              stockId: _stock[index].stockId,
                              qty: int.parse(orderqty.text),
                              rate: _stock[index].rate,
                              total: total,
                              saleDate: date,
                              customerId: 0,
                              invoice_no: null);
                          _sale.add(sale);
                        }
                        checked = false;
                        for (var i = 0; i < _preSale.length; i++) {
                          if (_preSale[i].stockId == _stock[index].stockId) {
                            var total =
                                _stock[index].rate! * int.parse(orderqty.text);
                            _preSale[i].qty =
                                _preSale[i].qty! + int.parse(orderqty.text);
                            _preSale[i].total = _preSale[i].total! + total;
                            checked = true;
                          }
                        }
                        if (checked != true) {
                          var total =
                              _stock[index].rate! * int.parse(orderqty.text);
                          preSale = PreSale(
                              stockId: _stock[index].stockId,
                              medicineName: _stock[index].medicineName,
                              qty: int.parse(orderqty.text),
                              rate: _stock[index].rate,
                              total: total);
                          _preSale.add(preSale);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(_preSale[0].total.toString())));
                        ;
                      }),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     messege();
                  //   },
                  //   child: Text('Show Message'),
                  //   // color: Colors.blue,
                  // ),
                ]);
              },
            );
          } else {
            return Center(
                child: Text(
                    "No employees found")); // Added fallback for no data scenario
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.ac_unit),
                        ),
                    maxLength: 8,
                    textAlign: TextAlign.center,
                    onSaved: (val) {
                      orderqty.text = val.toString();
                      setState(() {});
                    },
                    // autovalidate: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Quantity';
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
                // color: Colors.blue,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }

  messege() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(orderqty.text)));
  }
}
