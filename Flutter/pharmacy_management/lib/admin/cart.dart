import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/customer.dart';
import 'package:pharmacy_management/models/pre_sale.dart';
import 'package:pharmacy_management/models/sale.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:http/http.dart' as http;

List<Sale> objectsFromJson(String str) =>
    List<Sale>.from(json.decode(str).map((x) => Sale.fromJson(x)));
String objectsToJson(List<Sale> data) =>
    json.encode(List<Sale>.from(data.map((x) => x.toJson())));

// Customer json
List<Customer> customerFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));
String customerToJson(List<Customer> data) =>
    json.encode(List<Customer>.from(data.map((x) => x.toJson())));

class Cart extends StatefulWidget {
  const Cart({super.key, required this.sale, required this.preSale});
  final List<Sale> sale;
  final List<PreSale> preSale;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Ipconfig i = Ipconfig();
  List<Sale> _sale = [];
  List<PreSale> _preSale = [];
  List<PreSale> _PreSale = [];
  var _total;

  assainData() {
    _sale = [];
    _preSale = [];
    // _total=0.0;
    _sale = widget.sale;
    _preSale = widget.preSale;
    // for(int i=0; i<_preSale.length;i++){
    //   _total=_total+_preSale[i].total;
    // }
    return _preSale;
  }

  Future<List<PreSale>> status() async {
    final responce = await assainData();

    return responce;
  }

  //===========================future sale method============
  Future<String> saveSale() async {
    final response = await http.post(Uri.parse('${i.ip}save-sale'),
        body: jsonEncode(_sale), headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      // SnackBar s = SnackBar(content: Text("Get Data"));
      // ScaffoldMessenger.of(context).showSnackBar(s);
      return response.body;
    } else {
      throw Exception(
          "Failed to load employees"); // Changed exception message to be more descriptive
    }
  }
//==========================future method end=================

  @override
  void initState() {
    _total = 0;
    for (int i = 0; i < widget.preSale.length; i++) {
      _total = _total + widget.preSale[i].total;
    }
    // _sale=widget.sale;
    // _preSale=widget.preSale;
    // if(_preSale.length!=0){
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_preSale.length.toString())));
    // }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Nav(),
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Total: " + _total.toString()),
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
                onPressed: () async {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_sale.length.toString())));
                  await showTitleDialog();
                  String invoice = await saveSale();
                  if (invoice.isNotEmpty && invoice != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Sale complete invoice no is: " + invoice)));
                  }
                  _sale = [];
                  _preSale = [];
                  _PreSale = [];
                  _total = 0;
                },
                child: Text("Confirm")),
          ),
        ],
      )),
      body: FutureBuilder(
          future: status(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                      "Error: ${snapshot.error}")); // Improved error message
            } else if (snapshot.hasData && snapshot.data != null) {
              // Added null check for data
              _PreSale = snapshot.data!;
              // Initialize counters
              return ListView.builder(
                  itemCount: _PreSale.length,
                  itemBuilder: (context, index) {
                    // return Text("Hello data");
                    return ListTile(
                      leading: Text(_PreSale[index].medicineName.toString()),
                      trailing: Text("Price: " +
                          _PreSale[index].rate.toString() +
                          " Qty: " +
                          _PreSale[index].qty.toString() +
                          " Total: " +
                          _PreSale[index].total.toString()),
                    );
                  });
              // ListView.builder(
              //            itemCount: widget.preSale.length,
              //            itemBuilder: (context, index){
              //              return Center(child: Text(index.toString()),);
              //              // return ListTile(
              //              //   title:Text(widget.preSale[index].medicineName.toString()) ,
              //              //   trailing: Text("Rate: "+widget.preSale[index].rate.toString()+" Quantity: "+widget.preSale[index].qty.toString()+" Total: "+widget.preSale[index].total.toString()),
              //              // );
              //            }
              //        );
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     ElevatedButton(
              //         onPressed: () {}, child: Text("Confirm Order")),
              //   ],
              // );
            } else {
              return Text("error");
            }
          }),
    );
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();

  Future showTitleDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Form(
                key: _keyDialogForm,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        // icon: Icon(Icons.ac_unit),
                      ),
                      // maxLength: 8,
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _name.text = val.toString();
                        setState(() {});
                      },
                      // autovalidate: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Name';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone No',
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        // icon: Icon(Icons.ac_unit),
                      ),
                      maxLength: 11,
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _phoneNo.text = val.toString();
                        setState(() {});
                      },
                      // autovalidate: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Phone No';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        // icon: Icon(Icons.ac_unit),
                      ),
                      // maxLength: 8,
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _email.text = val.toString();
                        setState(() {});
                      },
                      // autovalidate: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        // icon: Icon(Icons.ac_unit),
                      ),
                      // maxLength: ,
                      textAlign: TextAlign.center,
                      onSaved: (val) {
                        _address.text = val.toString();
                        setState(() {});
                      },
                      // autovalidate: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Address';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  if (_keyDialogForm.currentState!.validate()) {
                    _keyDialogForm.currentState!.save();
                    Customer c = Customer(
                        customerId: 0,
                        name: _name.text,
                        phone: _phoneNo.text,
                        email: _email.text,
                        address: _address.text);
                    final response = await http.post(
                        Uri.parse('${i.ip}add-customer'),
                        body: jsonEncode(c.toJson()),
                        headers: {"content-type": "application/json"});
                    if (response.statusCode == 200) {
                      Customer customer =
                          Customer.fromJson(jsonDecode(response.body));
                      SnackBar s = SnackBar(
                          content: Text("Customer Id: " +
                              customer.customerId.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(s);
                      for (int i = 0; i < _sale.length; i++) {
                        _sale[i].customerId = customer.customerId;
                      }
                    } else {
                      throw Exception(
                          "Failed to load employees"); // Changed exception message to be more descriptive
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text('Ok'),
                // color: Colors.blue,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text('Cancel')),
            ],
          );
        });
  }
}
