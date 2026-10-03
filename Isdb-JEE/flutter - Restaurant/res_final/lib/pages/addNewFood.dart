import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:res_final/main.dart';
import 'package:res_final/model/booking.dart';
import 'package:http/http.dart' as http;
import 'package:res_final/pages/allFoods.dart';
import '../adminnav.dart';
import '../model/food.dart';
import 'ip.dart';

List<Food> objectsFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));
objectsToJson(List<Food> data) =>
    json.encode(List<Food>.from(data.map((x) => x.tojson())));

class Addnewfood extends StatefulWidget {
  const Addnewfood({super.key});

  @override
  State<Addnewfood> createState() => _AddnewfoodState();
}

class _AddnewfoodState extends State<Addnewfood> {
  TextEditingController _foodName = TextEditingController();
  TextEditingController _foodPrice = TextEditingController();
  TextEditingController _foodQty = TextEditingController();

  Future<Food> addFood() async {
    Food u = Food(
      foodName: _foodName.text,
      foodPrice: int.parse(_foodPrice.text),
      foodQty: int.parse(_foodQty.text),
    );
    Ip ip = Ip();
    final response = await http.post(Uri.parse(ip.ipAddress + '/addfood'),
        body: jsonEncode(u.tojson()),
        headers: {'content-type': 'application/json'});

    if (response.statusCode == 200) {
      SnackBar snk = SnackBar(content: Text("Booking Succesful"));
      ScaffoldMessenger.of(context).showSnackBar(snk);
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
      return Food.fromJson(jsonDecode(response.body));
    } else {
      SnackBar snk = SnackBar(content: Text("Error"));
      ScaffoldMessenger.of(context).showSnackBar(snk);
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Food",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _foodName,
                  decoration: InputDecoration(
                      labelText: "Food Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _foodPrice,
                  decoration: InputDecoration(
                      labelText: "Food Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: _foodQty,
                  decoration: InputDecoration(
                      labelText: "Food Quantity",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),

              ElevatedButton(
                child: Text("Add Food"),
                onPressed: () async {
                  Food st = await addFood();
                  if(st != null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Food Added")));



                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => MyApp()));

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to Add")));
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
