import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:res_final/model/booking.dart';
import 'package:http/http.dart' as http;
import 'ip.dart';

List<Booking> objectsFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));
String objectsToJson(List<Booking> data) =>
    json.encode(List<Booking>.from(data).map((x) => x.toJson()));

class Allbooking extends StatefulWidget {
  const Allbooking({super.key});

  @override
  State<Allbooking> createState() => _AllbookingState();
}

class _AllbookingState extends State<Allbooking> {
  Ip ip = Ip();
  Future<List<Booking>> fetchFoods() async {
    final response = await http.get(Uri.parse(ip.ipAddress+"/allbooked"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Booking.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Bookings',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder<List<Booking>>(
        future: fetchFoods(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return BookCard(
                  booking: snapshot.data![index],
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




    );
  }
}


class BookCard extends StatelessWidget {
  final Booking booking;

  const BookCard({Key? key, required this.booking}) : super(key: key);

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
              'Customer Name: ${booking.customerName ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Phone No: ${booking.phone ?? 'N/A'}',
            ),
            SizedBox(height: 5),
            Text(
              'Time: ${booking.bookingTime ?? 'N/A'}',
            ),
            SizedBox(height: 5),
            Text(
              'Date: ${booking.date ?? 'N/A'}',
            ),
            SizedBox(height: 5),
            Text(
              'Table No: ${booking.tableNo ?? 'N/A'}',
            ),
          ],
        ),
      ),
    );
  }


}