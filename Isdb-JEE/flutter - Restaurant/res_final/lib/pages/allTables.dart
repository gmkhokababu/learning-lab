import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../adminnav.dart';
import '../model/tableInfo.dart';
import 'ip.dart';

List<Tableinfo> objectsFromJson(String str) =>
    List<Tableinfo>.from(json.decode(str).map((x) => Tableinfo.fromJson(x)));
String objectsToJson(List<Tableinfo> data) =>
    json.encode(List<Tableinfo>.from(data).map((x) => x.toJson()));

class Alltables extends StatefulWidget {
  const Alltables({super.key});

  @override
  State<Alltables> createState() => _AlltablesState();
}

class _AlltablesState extends State<Alltables> {
  Future<List<Tableinfo>> showavailabletable() async {
    Ip ip = Ip();
    final response = await http.get(
      Uri.parse(ip.ipAddress +'/allbookedtable'),
    );
    if (response.statusCode == 200) {
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  @override
  void initState() {
    showavailabletable();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Adminnav(),
      appBar: AppBar(
        title: Text("Booked Tables",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
      ),

      body: ListView(
        children: [
          Container(
            height: 1000,
            child: FutureBuilder<List<Tableinfo>>(
              future: showavailabletable(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text(snapshot.data![index].tableNumber.toString())),
                        title: Text(snapshot.data![index].tablePosition.toString()),
                        trailing: Text(snapshot.data![index].fph.toString()),
                        subtitle: Text(snapshot.data![index].status.toString()),

                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),

    );
  }
}
