import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:pharmacy_management/admin/all_product_list_damage.dart';
import 'package:pharmacy_management/admin/all_product_list_return.dart';

import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/p_report.dart';
import 'package:pharmacy_management/models/purchase.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:intl/intl.dart'; // Importing the intl package
import 'package:http/http.dart' as http;

List<PReport> objectsFromJson(String str) =>
    List<PReport>.from(json.decode(str).map((x) => PReport.fromJson(x)));
String objectsToJson(List<PReport> data) =>
    json.encode(List<PReport>.from(data.map((x) => x.toJson())));

class ProductListDamage extends StatefulWidget {
  const ProductListDamage({super.key});

  @override
  State<ProductListDamage> createState() => _ProductListDamageState();
}

class _ProductListDamageState extends State<ProductListDamage> {
  TextEditingController _invoice=TextEditingController();

  Ipconfig i = Ipconfig();
  //===========================future method purchase report============
  Future<List<PReport>> purchaseReport() async {
    final response = await http.get(
      Uri.parse('${i.ip}purchase-report/'+_invoice.text),
    );
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Get Data"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    } else {
      throw Exception(
          "Failed to load employees"); // Changed exception message to be more descriptive
    }
  }
//==========================future method end=================

  // =========================Future method for navigation======
  Future<List<PReport>> navigate(value){
    if(value!=null) {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AllProductListDamage(allproduct: value,)
          ));
      return value;
    }else{
      return value;
    }
  }
// =========================Future method for navigation======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text(
          "Purchase Report",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _invoice,
              // readOnly: true,
              decoration: InputDecoration(
                labelText: "Invoice/Batch Id",
                // hintText: "yyyy-MM-dd",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try{
                List<PReport> response = await purchaseReport();
                var result = await navigate(response);
              }catch(e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to fetch data: $e")),
                );
              }
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
