import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/show_damage_list_details.dart';
import 'package:pharmacy_management/models/damage_list.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class ShowDamageList extends StatefulWidget {
  @override
  _ShowDamageListState createState() => _ShowDamageListState();
}
class _ShowDamageListState extends State<ShowDamageList> {
  Ipconfig i = Ipconfig();
  late Future<List<DamageList>> futureDamageList;

  @override
  void initState() {
    super.initState();
    futureDamageList = fetchDamageList();
  }

  Future<List<DamageList>> fetchDamageList() async {
    final response = await http.get(Uri.parse('${i.ip}get-damage'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => DamageList.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load damage list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Damage List'),
      ),
      body: FutureBuilder<List<DamageList>>(
        future: futureDamageList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<DamageList> damageList = snapshot.data!;
            return ListView.builder(
              itemCount: damageList.length,
              itemBuilder: (context, index) {
                DamageList damage = damageList[index];
                return ListTile(
                  title: Text(damage.invoice),
                  // subtitle: Text('Supplier: ${damage.supplier}\nBatch: ${damage.batchId}'),
                  subtitle: Text('Supplier: ${damage.supplier}'),
                  trailing: Text(
                    // DateFormat('yyyy-MM-dd').format(damage.damageDate),
                      'Total: ${damage.total}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowDamageListDetails(invoice: damage.invoice)));
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: Text(damage.medicineName),
                    //       content: SingleChildScrollView(
                    //         child: ListBody(
                    //           children: <Widget>[
                    //             Text('Supplier: ${damage.supplier}'),
                    //             Text('Batch: ${damage.batchId}'),
                    //             Text('Generic Name: ${damage.genericName}'),
                    //             Text('Invoice: ${damage.invoice}'),
                    //             Text('Qty: ${damage.returnQty}'),
                    //             Text('Rate: ${damage.purchaseRate}'),
                    //             Text('Total: ${damage.total}'),
                    //             Text('Damage Date: ${DateFormat('yyyy-MM-dd').format(damage.damageDate)}'),
                    //             Text('Expiry Date: ${DateFormat('yyyy-MM-dd').format(damage.exDate)}'),
                    //             Text('Purchase Date: ${DateFormat('yyyy-MM-dd').format(damage.pursDate)}'),
                    //             Text('Status: ${damage.status}'),
                    //           ],
                    //         ),
                    //       ),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           child: Text('Close'),
                    //           onPressed: () {
                    //             Navigator.of(context).pop();
                    //           },
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
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
