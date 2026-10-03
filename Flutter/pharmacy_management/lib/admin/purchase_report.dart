// import 'package:flutter/material.dart';
// import 'package:pharmacy_management/navigation/navigation.dart';
// import 'package:intl/intl.dart';
//
// class PurchaseReport extends StatefulWidget {
//   const PurchaseReport({super.key});
//
//   @override
//   State<PurchaseReport> createState() => _PurchaseReportState();
// }
//
// class _PurchaseReportState extends State<PurchaseReport> {
//
//   // DateTime? date;
//   TextEditingController _startDate = TextEditingController();
//   TextEditingController _endDate = TextEditingController();
//
//   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Nav(),
//       appBar: AppBar(
//         title: Text(
//           "Purchase Report",
//           textAlign: TextAlign.center,
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           // Text("Hello")
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TextFormField(
//               controller: _startDate,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "Start Date",
//                 hintText: "yyyy-MM-dd",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter Date';
//                 } else if (value != null ||
//                     value.isNotEmpty && value.length != 10) {
//                   return 'Please enter Correct Date like "2024-12-25"';
//                 }
//                 return null;
//               },
//               // onSaved: (value) {
//               //   _startDate.text = value;
//               // },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10.0),
//             child: TextFormField(
//               controller: _endDate,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: "End Date",
//                 hintText: "yyyy-MM-dd",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter Date';
//                 } else if (value != null ||
//                     value.isNotEmpty && value.length != 10) {
//                   return 'Please enter Correct Date like "2024-12-25"';
//                 }
//                 return null;
//               },
//               // onSaved: (value) {
//               //   _startDate.text = value;
//               // },
//             ),
//           ),
//
//           ElevatedButton(
//             onPressed: () {
//
//                 ScaffoldMessenger.of(context)
//                     .showSnackBar(SnackBar(content: Text("Start Date: "+_startDate.text+"\n End Date: "+_endDate.text)));
//
//             },
//             child: Text("Show Date"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/show_purchase_report.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/p_report.dart';
import 'package:pharmacy_management/models/purchase.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:intl/intl.dart'; // Importing the intl package
import 'package:http/http.dart' as http;

List<PReport> objectsFromJson(String str) =>
    List<PReport>.from(json.decode(str).map((x) => PReport.fromJson(x)));
String objectsToJson(List<PReport> data) =>
    json.encode(List<PReport>.from(data.map((x) => x.toJson())));

class PurchaseReport extends StatefulWidget {
  const PurchaseReport({super.key});

  @override
  State<PurchaseReport> createState() => _PurchaseReportState();
}

class _PurchaseReportState extends State<PurchaseReport> {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();

  Ipconfig i = Ipconfig();
  //===========================future method purchase report============
  Future<List<PReport>> purchaseReport() async {
    final response = await http.get(
      Uri.parse('${i.ip}purchase-report/' +
          _startDate.text +
          "/" +
          _endDate.text +
          "/null" +
          "/null"),
    );
    if (response.statusCode == 200) {
      // SnackBar s = SnackBar(content: Text("Get Data"));
      // ScaffoldMessenger.of(context).showSnackBar(s);
      return objectsFromJson(response.body);
    } else {
      throw Exception(
          "Failed to load employees"); // Changed exception message to be more descriptive
    }
  }
//==========================future method end=================

  // =========================Future method for navigation======
  Future<bool> navigate(value){
    if(value!=null) {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ShowPurchaseReport(purchaseReport: value)
          ));
      return value;
    }else{
      return value;
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd')
            .format(picked); // Using DateFormat to format the date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text(
          "Purchase Report",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _startDate,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Start Date",
                // hintText: "yyyy-MM-dd",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onTap: () {
                _selectDate(context, _startDate);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Date';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _endDate,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "End Date",
                // hintText: "yyyy-MM-dd",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onTap: () {
                _selectDate(context, _endDate);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Date';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try{
              List<PReport> response = await purchaseReport();
              var result = await navigate(response);

              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text("Start Date: " + _startDate.text + "\n End Date: " + _endDate.text),
              //   ),
              // );
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
              //             ShowPurchaseReport(purchaseReport: response)
              //     ));
              }catch(e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to fetch data: $e")),
                );
              }
            },
            child: Text("Show Report"),
          ),
        ],
      ),
    );
  }
}
