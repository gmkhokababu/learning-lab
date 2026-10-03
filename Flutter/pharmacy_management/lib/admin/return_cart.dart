import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/dashboard.dart';
import 'package:pharmacy_management/models/return.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:http/http.dart' as http;


List<Return> objectsFromJson(String str) =>
    List<Return>.from(json.decode(str).map((x) => Return.fromJson(x)));
String objectsToJson(List<Return> data) =>
    json.encode(List<Return>.from(data.map((x) => x.toJson())));

class ReturnCart extends StatefulWidget {
  const ReturnCart({super.key, required this.returnList});
  final List<Return> returnList;

  @override
  State<ReturnCart> createState() => _ReturnCartState();
}

class _ReturnCartState extends State<ReturnCart> {
  Ipconfig i = Ipconfig();
  List<Return> _returnList=[];


  assainData() {
    _returnList = [];
    _returnList = widget.returnList;
    return _returnList;
  }

  Future<List<Return>> status() async {
    final responce = await assainData();

    return responce;
  }

  //===========================future sale method============
  Future<String> saveSale() async {
    final response = await http.post(Uri.parse('${i.ip}purchase-return'),
        body: jsonEncode(_returnList), headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Return Success"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return response.body;
    } else {
      throw Exception(
          "Failed to load Return"); // Changed exception message to be more descriptive
    }
  }
//==========================future method end=================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                    onPressed: () async {
                      String invoice = await saveSale();
                      if (invoice.isNotEmpty && invoice != null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                            Text("Sale complete invoice no is: " + invoice)));
                      }
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));

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
              _returnList = snapshot.data!;
              // Initialize counters
              return ListView.builder(
                  itemCount: _returnList.length,
                  itemBuilder: (context, index) {
                    // return Text("Hello data");
                    return ListTile(
                      title:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${_returnList[index].medicineName.toString()}"),
                          Text("Supplier: ${_returnList[index].supplier.toString()}"),
                          // Text("Batch Id: ${_returnList[index].batchId.toString()}"),
                        ],
                      ) ,
                      subtitle: Text("Return Quantity: " +
                          _returnList[index].returnQty.toString()),
                    );
                  });
            } else {
              return Text("error");
            }
          }),
    );
  }
}
