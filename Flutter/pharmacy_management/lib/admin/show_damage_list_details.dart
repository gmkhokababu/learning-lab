// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:pharmacy_management/admin/dashboard.dart';
// import 'package:pharmacy_management/admin/show_damage_list.dart';
// import 'package:pharmacy_management/models/damage.dart';
// import 'package:pharmacy_management/ipset/ipconfig.dart';
// import 'package:intl/intl.dart';
// import 'package:http/http.dart' as http;
// import 'package:pharmacy_management/models/return.dart';
//
// List<Damage> objectsFromJson(String str) =>
//     List<Damage>.from(json.decode(str).map((x) => Damage.fromJson(x)));
// String objectsToJson(List<Damage> data) =>
//     json.encode(List<Damage>.from(data.map((x) => x.toJson())));
//
// //return=============
// List<Return> returnFromJson(String str) =>
//     List<Return>.from(json.decode(str).map((x) => Return.fromJson(x)));
// String returnToJson(List<Return> data) =>
//     json.encode(List<Return>.from(data.map((x) => x.toJson())));
//
// class ShowDamageListDetails extends StatefulWidget {
//   const ShowDamageListDetails({super.key, required this.invoice});
//   final String invoice;
//
//   @override
//   State<ShowDamageListDetails> createState() => _ShowDamageListDetailsState();
// }
//
// //=================Working class========================
// class _ShowDamageListDetailsState extends State<ShowDamageListDetails> {
//   String _invoice = '';
//   Ipconfig i = Ipconfig();
//   late Future<List<Damage>> futureDamageList;
//   late List<Return> _returnproduct;
//
//   //===========================future method purchase report============
//   Future<String> returnProducts() async {
//     final response = await http.post(Uri.parse('${i.ip}purchase-return'),
//           body: jsonEncode(_returnproduct), headers: {"content-type": "application/json"});
//       if (response.statusCode == 200) {
//         SnackBar s = SnackBar(content: Text("Return Success"));
//         ScaffoldMessenger.of(context).showSnackBar(s);
//         return response.body;
//       } else {
//         throw Exception(
//             "Failed to Return"); // Changed exception message to be more descriptive
//       }
//   }
//   Future<String> updateDamageStatus() async {
//     final response = await http.put(Uri.parse('${i.ip}update-damage'),
//         body: jsonEncode(futureDamageList), headers: {"content-type": "application/json"});
//     if (response.statusCode == 200) {
//       SnackBar s = SnackBar(content: Text("Return Success"));
//       ScaffoldMessenger.of(context).showSnackBar(s);
//       return response.body;
//     } else {
//       throw Exception(
//           "Failed to update Damage"); // Changed exception message to be more descriptive
//     }
//   }
//
//   Future<List<Damage>> fetchDamageList() async {
//     final response = await http.get(Uri.parse('${i.ip}get-damage/' + _invoice));
//
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => Damage.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load damage list');
//     }
//   }
// //==========================future method end=================
//
//   //=====================future method for return product and update status of damage list=======
//   addReturn(Damage val) {
//     int initiallenth=_returnproduct.length;
//     Return returnproduct = Return(
//         returnId: 0,
//         returnDate: DateTime.now(),
//         supplier: val.supplier,
//         medicineName: val.medicineName,
//         paking: val.paking,
//         genericName: val.genericName,
//         batchId: val.batchId,
//         exDate: val.exDate,
//         pursDate: val.pursDate,
//         invoice: val.invoice,
//         returnQty: val.returnQty,
//         purchaseRate: val.purchaseRate,
//         status: "Damaged Returend",
//         purshasId: val.purshasId);
//     val.status="Returend";
//     _returnproduct.add(returnproduct);
//     return _returnproduct.length>initiallenth;
//   }
//   Future assainreturn() async{
//     // bool status=false;
//     for(int i=0;i<futureDamageList.length;i++){
//       await addReturn(futureDamageList[i]);
//     }
//
//     // return status;
//   }
//
//   @override
//   void initState() {
//     _invoice = widget.invoice;
//     futureDamageList = fetchDamageList();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           // Text("Damage"),
//           Padding(
//             padding: EdgeInsets.all(5),
//             child: ElevatedButton(
//                 onPressed: () async {
//                   await assainreturn();
//                   await returnProducts();
//                   await updateDamageStatus();
//                   // String invoice = await saveSale();
//                   // if (invoice.isNotEmpty && invoice != null) {
//                   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   //       content:
//                   //       Text("Sale complete invoice no is: " + invoice)));
//                   // }
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ShowDamageList()));
//                 },
//                 child: Text("Return Damage ")),
//           ),
//         ],
//       )),
//       body: FutureBuilder<List<Damage>>(
//         future: futureDamageList,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             List<Damage> damageList = snapshot.data!;
//             return ListView.builder(
//               itemCount: damageList.length,
//               itemBuilder: (context, index) {
//                 Damage damage = damageList[index];
//                 return ListTile(
//                   title: Text(damage.medicineName),
//                   subtitle: Text(
//                       'Supplier: ${damage.supplier}\nBatch: ${damage.batchId}'),
//                   // subtitle: Text('Supplier: ${damage.supplier}'),
//                   trailing: Text(
//                     // DateFormat('yyyy-MM-dd').format(damage.damageDate),
//                     'Total: ${damage.returnQty}',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text(damage.medicineName),
//                           content: SingleChildScrollView(
//                             child: ListBody(
//                               children: <Widget>[
//                                 Text('Supplier: ${damage.supplier}'),
//                                 Text('Batch: ${damage.batchId}'),
//                                 Text('Generic Name: ${damage.genericName}'),
//                                 Text('Invoice: ${damage.invoice}'),
//                                 Text('Qty: ${damage.returnQty}'),
//                                 Text('Rate: ${damage.purchaseRate}'),
//                                 Text(
//                                     'Total: ${damage.returnQty * damage.purchaseRate}'),
//                                 Text(
//                                     'Damage Date: ${DateFormat('yyyy-MM-dd').format(damage.damageDate)}'),
//                                 Text(
//                                     'Expiry Date: ${DateFormat('yyyy-MM-dd').format(damage.exDate)}'),
//                                 Text(
//                                     'Purchase Date: ${DateFormat('yyyy-MM-dd').format(damage.pursDate)}'),
//                                 // Text('Status: ${damage.status}'),
//                               ],
//                             ),
//                           ),
//                           actions: <Widget>[
//                             TextButton(
//                               child: Text('Close'),
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/dashboard.dart';
import 'package:pharmacy_management/admin/show_damage_list.dart';
import 'package:pharmacy_management/models/damage.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_management/models/return.dart';

List<Damage> objectsFromJson(String str) =>
    List<Damage>.from(json.decode(str).map((x) => Damage.fromJson(x)));
String objectsToJson(List<Damage> data) =>
    json.encode(List<Damage>.from(data.map((x) => x.toJson())));

//return=============
List<Return> returnFromJson(String str) =>
    List<Return>.from(json.decode(str).map((x) => Return.fromJson(x)));
String returnToJson(List<Return> data) =>
    json.encode(List<Return>.from(data.map((x) => x.toJson())));

class ShowDamageListDetails extends StatefulWidget {
  const ShowDamageListDetails({super.key, required this.invoice});
  final String invoice;

  @override
  State<ShowDamageListDetails> createState() => _ShowDamageListDetailsState();
}

//=================Working class========================
class _ShowDamageListDetailsState extends State<ShowDamageListDetails> {
  String _invoice = '';
  Ipconfig i = Ipconfig();
  late Future<List<Damage>> futureDamageList;
  late List<Return> _returnproduct = []; // Initialize the list properly
  late List<Damage> _damageList=[];

  //===========================future method purchase report============
  Future<String> returnProducts() async {
    final response = await http.post(Uri.parse('${i.ip}purchase-return'),
        body: jsonEncode(_returnproduct),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Return Success"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return response.body;
    } else {
      throw Exception(
          "Failed to Return"); // Changed exception message to be more descriptive
    }
  }

  Future<String> updateDamageStatus() async {
List<Damage> damage=await updateDamageList();
    final response = await http.put(Uri.parse('${i.ip}update-damage'),
        body: jsonEncode(damage), // This should be a resolved list, not a Future
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      SnackBar s = SnackBar(content: Text("Damage Updated"));
      ScaffoldMessenger.of(context).showSnackBar(s);
      return response.body;
    } else {
      throw Exception(
          "Failed to update Damage"); // Changed exception message to be more descriptive
    }
  }

  Future<List<Damage>> fetchDamageList() async {
    final response = await http.get(Uri.parse('${i.ip}get-damage/' + _invoice));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Damage.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load damage list');
    }
  }

  //==========================future method end=================

  //=====================future method for return product and update status of damage list=======
  bool addReturn(Damage val) { // Changed to return bool
    int initialLength = _returnproduct.length;
    Return returnproduct = Return(
        returnId: 0,
        returnDate: DateTime.now(),
        supplier: val.supplier,
        medicineName: val.medicineName,
        paking: val.paking,
        genericName: val.genericName,
        batchId: val.batchId,
        exDate: val.exDate,
        pursDate: val.pursDate,
        invoice: val.invoice,
        returnQty: val.returnQty,
        purchaseRate: val.purchaseRate,
        status: "Damaged Returend",
        purshasId: val.purshasId);
    // val.status = "Returned";
    _returnproduct.add(returnproduct);
    return _returnproduct.length > initialLength;
  }

  Future<void> assainreturn() async { // Changed to return Future<void>
    for (var damage in await futureDamageList) { // Await the futureDamageList to get the data
      addReturn(damage);
    }
  }
  Future<List<Damage>> updateDamageList() async { // Changed to return Future<void>
    for (var damage in await futureDamageList) { // Await the futureDamageList to get the data
      damage.status="Returned";
      _damageList.add(damage);
    }
    return _damageList;
  }

  @override
  void initState() {
    _invoice = widget.invoice;
    futureDamageList = fetchDamageList();
    // TODO: implement initState
    super.initState();
  }

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
                      try {
                        await assainreturn();
                        await returnProducts();
                        await updateDamageStatus();
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => ShowDamageList()));
                      }catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to fetch data: $e")),
                        );
                      }
                    },
                    child: Text("Return Damage")),
              ),
            ],
          )),
      body: FutureBuilder<List<Damage>>(
        future: futureDamageList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Damage> damageList = snapshot.data!;
            return ListView.builder(
              itemCount: damageList.length,
              itemBuilder: (context, index) {
                Damage damage = damageList[index];
                return ListTile(
                  title: Text(damage.medicineName),
                  subtitle: Text(
                      'Supplier: ${damage.supplier}\nBatch: ${damage.batchId}'),
                  trailing: Text(
                    'Total: ${damage.returnQty}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(damage.medicineName),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Supplier: ${damage.supplier}'),
                                Text('Batch: ${damage.batchId}'),
                                Text('Generic Name: ${damage.genericName}'),
                                Text('Invoice: ${damage.invoice}'),
                                Text('Qty: ${damage.returnQty}'),
                                Text('Rate: ${damage.purchaseRate}'),
                                Text(
                                    'Total: ${damage.returnQty * damage.purchaseRate}'),
                                Text(
                                    'Damage Date: ${DateFormat('yyyy-MM-dd').format(damage.damageDate)}'),
                                Text(
                                    'Expiry Date: ${DateFormat('yyyy-MM-dd').format(damage.exDate)}'),
                                Text(
                                    'Purchase Date: ${DateFormat('yyyy-MM-dd').format(damage.pursDate)}'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
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
