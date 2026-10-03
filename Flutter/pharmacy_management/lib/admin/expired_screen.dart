import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_management/models/expired_list.dart'; // Import the model for expired items
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ExpiredScreen extends StatefulWidget {
  @override
  _ExpiredScreenState createState() => _ExpiredScreenState();
}

class _ExpiredScreenState extends State<ExpiredScreen> {
  Ipconfig i = Ipconfig();
  late Future<List<ExpiredList>> futureExpiredList;

  @override
  void initState() {
    super.initState();
    futureExpiredList = fetchExpiredList();
  }

  Future<List<ExpiredList>> fetchExpiredList() async {
    final response = await http.get(Uri.parse('${i.ip}get-expired'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => ExpiredList.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load expired list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Expired List'),
      ),
      body: FutureBuilder<List<ExpiredList>>(
        future: futureExpiredList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<ExpiredList> expiredList = snapshot.data!;
            return ListView.builder(
              itemCount: expiredList.length,
              itemBuilder: (context, index) {
                ExpiredList expired = expiredList[index];
                return ListTile(
                  title: Text(expired.medicineName ?? 'Unknown Medicine'),
                  subtitle: Text('Batch: ${expired.batchId ?? 'Unknown Batch'}'),
                  trailing: Text(
                    'Expiry Date: ${expired.exDate != null ? DateFormat('yyyy-MM-dd').format(expired.exDate!) : 'Unknown Date'}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    // Navigate to details screen or perform any action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpiredItemDetailsScreen(
                          expiredItem: expired,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class ExpiredItemDetailsScreen extends StatelessWidget {
  final ExpiredList expiredItem;

  ExpiredItemDetailsScreen({required this.expiredItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expired Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Medicine Name: ${expiredItem.medicineName ?? 'Unknown Medicine'}', style: TextStyle(fontSize: 18.0)),
            Text('Batch ID: ${expiredItem.batchId ?? 'Unknown Batch'}', style: TextStyle(fontSize: 18.0)),
            Text('Expiry Date: ${expiredItem.exDate != null ? DateFormat('yyyy-MM-dd').format(expiredItem.exDate!) : 'Unknown Date'}', style: TextStyle(fontSize: 18.0)),
            Text('Supplier: ${expiredItem.supplier ?? 'Unknown Supplier'}', style: TextStyle(fontSize: 18.0)),
            Text('Packing: ${expiredItem.packing ?? 'Unknown Packing'}', style: TextStyle(fontSize: 18.0)),
            Text('Generic Name: ${expiredItem.genericName ?? 'Unknown Generic Name'}', style: TextStyle(fontSize: 18.0)),
            Text('Invoice: ${expiredItem.invoice ?? 'Unknown Invoice'}', style: TextStyle(fontSize: 18.0)),
            Text('Return Qty: ${expiredItem.returnQty ?? 0}', style: TextStyle(fontSize: 18.0)),
            Text('Purchase Rate: ${expiredItem.purchaseRate ?? 0.0}', style: TextStyle(fontSize: 18.0)),
            Text('Status: ${expiredItem.status ?? 'Unknown Status'}', style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
