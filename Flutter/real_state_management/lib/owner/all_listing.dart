import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_state_management/all_nav/owner_nav.dart';
import 'package:real_state_management/extension/string_extension.dart';
import 'package:real_state_management/model/ipaddress.dart';
import 'package:real_state_management/model/property.dart';
import 'package:http/http.dart' as http;

List<Property> objectsFromJson(String str) =>
    List<Property>.from(json.decode(str).map((x) => Property.fromJson(x)));
String objectsToJson(List<Property> data) =>
    json.encode(List<Property>.from(data).map((x) => x.toJson()));

class AllListing extends StatefulWidget {
  const AllListing({super.key});

  @override
  State<AllListing> createState() => _AllListingState();
}

class _AllListingState extends State<AllListing> {
  Ipaddress i = Ipaddress();
  late List<Property> _property = [];
  Future<List<Property>> showall() async {
    final response = await http.get(
      Uri.parse('${i.ip}getproperty'),
    );
    if (response.statusCode == 200) {
      // SnackBar s= SnackBar(content: Text("Get Data"));
      // ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    } else {
      throw Exception("Failed");
    }
  }

  // getproperty
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OwnerNav(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<Property>>(
                future: showall(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _property = snapshot.data!;
                    // SnackBar s= SnackBar(content: Text("Get Data"));
                    // ScaffoldMessenger.of(context).showSnackBar(s);
                    return ListView.builder(
                      itemCount: _property.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_property[index].type.toString().capitalize()+" "+_property[index].landtype.toString().capitalize()+" For "+_property[index].saleType.toString().capitalize()),
                          leading: Text(_property[index].id.toString().capitalize()),
                          subtitle: Text(_property[index].location.toString().capitalize()),
                          trailing: Text(_property[index].status.toString().capitalize()),

                        );
                      },
                    );
                  }
                  else if(snapshot.hasError){
                    return Text("Error");
                  }else{
                    return CircularProgressIndicator();
                  }
                }
                ),
          ),
        ],
      ),
    );
  }
}
