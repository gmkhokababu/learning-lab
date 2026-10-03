import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:res_final/model/food.dart';

import 'ip.dart';

List<Food> objectsFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));
String objectsToJson(List<Food> data) =>
    json.encode(List<Food>.from(data).map((x) => x.tojson()));

class Allfoods extends StatefulWidget {
  const Allfoods({super.key});

  @override
  State<Allfoods> createState() => _AllfoodsState();
}

class _AllfoodsState extends State<Allfoods> {

  Ip ip = Ip();
  Future<List<Food>> fetchFoods() async {
    final response = await http.get(Uri.parse(ip.ipAddress+"/allfood"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Food.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }

  // @override
  // void initState() {
  //   showallfood();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Items',style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder<List<Food>>(
          future: fetchFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    food: snapshot.data![index],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food ID: ${food.foodId ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Name: ${food.foodName ?? 'N/A'}',
            ),
            SizedBox(height: 5),
            Text(
              'Price: ${food.foodPrice ?? 'N/A'}',
            ),
            SizedBox(height: 5),
            Text(
              'Quantity: ${food.foodQty ?? 'N/A'}',
            ),
          ],
        ),
      ),
    );
  }


}
