// import 'package:flutter/material.dart';
// import 'package:pharmacy_management/admin/purchase_report.dart';
// import 'package:pharmacy_management/models/purchase.dart';
// import 'package:pharmacy_management/navigation/navigation.dart';
//
// class ShowPurchaseReport extends StatefulWidget {
//   const ShowPurchaseReport({super.key, required this.purchaseReport});
//   final List<Purchase> purchaseReport;
//
//   @override
//   State<ShowPurchaseReport> createState() => _ShowPurchaseReportState();
// }
//
// class _ShowPurchaseReportState extends State<ShowPurchaseReport> {
//   List<Purchase> _purchaseReport=[];
//   assainData(){
//     _purchaseReport=widget.purchaseReport;
//     if(_purchaseReport==widget.purchaseReport){
//       return true;
//     }else{
//       return false;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Nav(),
//       appBar: AppBar(
//         title: Text("Purchase Report"),
//       ),
//       body: FutureBuilder(
//         future: assainData(),
//         builder: (context,snapshot){
//           if (snapshot.hasError) {
//             return Center(
//                 child: Text(
//                     "Error: ${snapshot.error}")); // Improved error message
//           } else if (snapshot.hasData && snapshot.data != null) {
//             // Added null check for data
//             // _PreSale = snapshot.data!;
//             // Initialize counters
//             return ListView.builder(
//                 itemCount: _purchaseReport.length,
//                 itemBuilder: (context, index) {
//                   // return Text("Hello data");
//                   return ListTile(
//                     leading: Text(_purchaseReport[index].medicineName.toString()),
//                     trailing: Text("Purchase: " +
//                         _purchaseReport[index].purchaseRate.toString() +
//                         " Qty: " +
//                         _purchaseReport[index].qty.toString() +
//                         " Total: "
//                         // +((_purchaseReport[index].purchaseRate)!*double.parse(_purchaseReport[index].qty.toString())).toString()
//                   ),
//                   );
//                 });
//           } else {
//             return Text("error");
//           }
//         },
//       ),
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/show_purchase_details.dart';
import 'package:pharmacy_management/models/p_report.dart';
import 'package:pharmacy_management/models/purchase.dart';
import 'package:pharmacy_management/navigation/navigation.dart';

class ShowPurchaseReport extends StatefulWidget {
  const ShowPurchaseReport({super.key, required this.purchaseReport});
  final List<PReport> purchaseReport;

  @override
  State<ShowPurchaseReport> createState() => _ShowPurchaseReportState();
}

class _ShowPurchaseReportState extends State<ShowPurchaseReport> {
  List<PReport> _purchaseReport = [];

  // Corrected method name to assignData and added return type Future<bool>
  Future<bool> assignData() async {
    _purchaseReport = widget.purchaseReport;
    return _purchaseReport == widget.purchaseReport;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text("Purchase Report"),
      ),
      body: FutureBuilder<bool>(
        future: assignData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return ListView.builder(
              itemCount: _purchaseReport.length,
              itemBuilder: (context, index) {
                final purchase = _purchaseReport[index];

                // Ensure purchaseRate and qty are valid numbers
                final purchaseRate = purchase.purchaseRate ?? 0.0;
                final qty = purchase.qty ?? 0;

                // Calculate total safely
                final total = (purchaseRate * qty).toString();

                return ListTile(
                  leading: Text(purchase.medicineName ?? 'Unknown'),
                  trailing: Text(
                    "Purchase: ${purchaseRate.toString()} Qty: ${qty.toString()} Total: $total",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowPurchaseDetails(
                          purchase: purchase,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
