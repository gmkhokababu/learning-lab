import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:pharmacy_management/admin/dashboard.dart';
import 'package:pharmacy_management/models/damage.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:http/http.dart' as http;

List<Damage> objectsFromJson(String str) =>
    List<Damage>.from(json.decode(str).map((x) => Damage.fromJson(x)));
String objectsToJson(List<Damage> data) =>
    json.encode(List<Damage>.from(data.map((x) => x.toJson())));

class DamagedCart extends StatefulWidget {
  const DamagedCart({super.key, required this.damageList});
  final List<Damage> damageList;

  @override
  State<DamagedCart> createState() => _DamagedCartState();
}

class _DamagedCartState extends State<DamagedCart> {
  Ipconfig i = Ipconfig();
  List<Damage> _damageList = [];

  assainData() {
    _damageList = [];
    _damageList = widget.damageList;
    return _damageList;
  }

  Future<List<Damage>> status() async {
    final responce = await assainData();

    return responce;
  }

  //===========================future sale method============
  Future<String> saveSale() async {
    final response = await http.post(Uri.parse('${i.ip}save-damage'),
        body: jsonEncode(_damageList),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Damage saved!"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return response.body;
    } else {
      throw Exception(
          "Failed to load employees"); // Changed exception message to be more descriptive
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
          // Text("Damage"),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
                child: Text("Confirm ")),
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
              _damageList = snapshot.data!;
              // Initialize counters
              return ListView.builder(
                  itemCount: _damageList.length,
                  itemBuilder: (context, index) {
                    // return Text("Hello data");
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${_damageList[index].medicineName.toString()}"),
                          Text(
                              "Supplier: ${_damageList[index].supplier.toString()}"),
                          // Text("Batch Id: ${_returnList[index].batchId.toString()}"),
                        ],
                      ),
                      subtitle: Text("Return Quantity: " +
                          _damageList[index].returnQty.toString()),
                    );
                  });
            } else {
              return Text("error");
            }
          }),
    );
  }
}
