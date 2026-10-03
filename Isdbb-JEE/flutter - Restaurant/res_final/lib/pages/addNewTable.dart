import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:res_final/main.dart';
import 'package:res_final/model/tableInfo.dart';
import 'package:http/http.dart' as http;
import '../adminnav.dart';
import 'ip.dart';




List<Tableinfo> objectsFromJson(String str) =>
    List<Tableinfo>.from(json.decode(str).map((x) => Tableinfo.fromJson(x)));
objectsToJson(List<Tableinfo> data) =>
    json.encode(List<Tableinfo>.from(data.map((x) => x.toJson())));

class Addnewtable extends StatefulWidget {
  const Addnewtable({super.key});

  @override
  State<Addnewtable> createState() => _AddnewtableState();
}

class _AddnewtableState extends State<Addnewtable> {


  TextEditingController _tableNumber = TextEditingController();
  TextEditingController _tableSit = TextEditingController();
  TextEditingController _tablePosition = TextEditingController();

  TextEditingController _fph = TextEditingController();


  Future<Tableinfo> insertTable() async {
    Tableinfo u = Tableinfo(

        tableNumber: int.parse(_tableNumber.text),
        tableSit: int.parse(_tableSit.text),
        tablePosition: _tablePosition.text,
        fph: int.parse(_fph.text),
        );

    Ip ip = Ip();
    final response = await http.post(
        Uri.parse(ip.ipAddress +'/addtable'),
        body: jsonEncode(u.toJson()),
        headers: {
          'content-type':'application/json'

        }

    );

    if(response.statusCode == 200){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
      return Tableinfo.fromJson(jsonDecode(response.body));

    } else {
      SnackBar snk = SnackBar(content: Text("Error"));
      ScaffoldMessenger.of(context).showSnackBar(snk);
      throw Exception("Error");

    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Add Table"),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _tableNumber,
                  decoration: InputDecoration(
                    labelText: "Table Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _tableSit,
                  decoration: InputDecoration(
                    labelText: "Number of sits",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _tablePosition,
                  decoration: InputDecoration(
                    labelText: "Position",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _fph,
                  decoration: InputDecoration(
                    labelText: "Fare per hour",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text("Add Table"),
                onPressed: () async {
                  Tableinfo st = await insertTable();
                  if(st != null){

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Table Added")));


                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => MyApp()));

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add table")));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
