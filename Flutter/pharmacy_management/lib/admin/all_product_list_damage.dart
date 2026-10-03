// import 'package:flutter/material.dart';
// import 'package:pharmacy_management/admin/damaged_cart.dart';
// import 'package:pharmacy_management/admin/return_cart.dart';
// import 'package:pharmacy_management/models/damage.dart';
// import 'package:pharmacy_management/models/p_report.dart';
// import 'package:pharmacy_management/models/return.dart';
// import 'package:pharmacy_management/navigation/navigation.dart';
// import 'package:intl/intl.dart'; // Importing the intl package
//
// class AllProductListDamage extends StatefulWidget {
//   const AllProductListDamage({super.key, required this.allproduct});
//   final List<PReport> allproduct;
//
//   @override
//   State<AllProductListDamage> createState() => _AllProductListDamageState();
// }
//
// class _AllProductListDamageState extends State<AllProductListDamage> {
//   final TextEditingController orderqty = TextEditingController();
//   final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();
//   List<PReport> _allproduct = [];
//   List<Damage> _damage = [];
//
//   Damage damageProduct = Damage(
//       damageId: 0,
//       damageDate: DateTime.now(),
//       supplier: "",
//       medicineName: "",
//       paking: 0,
//       genericName: "",
//       batchId: "",
//       exDate: DateTime.now(),
//       pursDate: DateTime.now(),
//       invoice: "",
//       returnQty: 0,
//       purchaseRate: 0.0,
//       status: "Damaged",
//       purshasId: 0);
//
//   Future<bool> assignData() async {
//     _allproduct = widget.allproduct;
//     return _allproduct == widget.allproduct;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Nav(),
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               "Damage",
//               textAlign: TextAlign.center,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => DamagedCart(
//                               damageList: _damage,
//                             )));
//               },
//               child: Icon(Icons.shopping_cart),
//               // style: ,
//             )
//           ],
//         ),
//       ),
//       body: FutureBuilder<bool>(
//         future: assignData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error: ${snapshot.error}"),
//             );
//           } else if (snapshot.hasData && snapshot.data == true) {
//             return ListView.builder(
//               itemCount: _allproduct.length,
//               itemBuilder: (context, index) {
//                 final allproduct = _allproduct[index];
//
//                 return ListTile(
//                   leading: Text(allproduct.medicineName ?? 'Unknown'),
//                   trailing: Text(
//                     "Supplier: ${allproduct.supplier ?? 'Unknown'},  Batch: ${allproduct.batchId ?? 'Unknown'}",
//                   ),
//                   onTap: () async {
//                     try {
//                       await showTitleDialog();
//                       var checked = false;
//                       for (var i = 0; i < _damage.length; i++) {
//                         if (_damage[i].batchId == _allproduct[index].batchId) {
//                           _damage[i].returnQty =
//                               _damage[i].returnQty! + int.parse(orderqty.text);
//                           checked = true;
//                         }
//                       }
//                       if (checked != true) {
//                         damageProduct = Damage(
//                             damageId: 0,
//                             damageDate: DateTime.now(),
//                             supplier: _damage[index].supplier,
//                             medicineName: _damage[index].medicineName,
//                             paking: _damage[index].paking,
//                             genericName: _damage[index].genericName,
//                             batchId: _damage[index].batchId,
//                             exDate: _damage[index].exDate,
//                             pursDate: _damage[index].pursDate,
//                             invoice: _damage[index].invoice,
//                             returnQty: int.parse(orderqty.text),
//                             purchaseRate: _damage[index].purchaseRate,
//                             status: "Damaged",
//                             purshasId: _damage[index].purshasId);
//                         _damage.add(damageProduct);
//                       }
//                     }catch(e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Failed to fetch data: $e")),
//                       );
//                     }
//                     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_damage.length}")));
//                   },
//                 );
//               },
//             );
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
//
//   Future showTitleDialog() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Form(
//               key: _keyDialogForm,
//               child: Column(
//                 children: <Widget>[
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                         // icon: Icon(Icons.ac_unit),
//                         ),
//                     maxLength: 8,
//                     textAlign: TextAlign.center,
//                     onSaved: (val) {
//                       orderqty.text = val.toString();
//                       setState(() {});
//                     },
//                     // autovalidate: true,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter Quantity';
//                       }
//
//                       return null;
//                     },
//                   )
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   if (_keyDialogForm.currentState!.validate()) {
//                     _keyDialogForm.currentState!.save();
//
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Ok'),
//                 // color: Colors.blue,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Cancel')),
//             ],
//           );
//         });
//   }
// }
import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/damaged_cart.dart';
import 'package:pharmacy_management/models/damage.dart';
import 'package:pharmacy_management/models/p_report.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:intl/intl.dart';

class AllProductListDamage extends StatefulWidget {
  const AllProductListDamage({super.key, required this.allproduct});
  final List<PReport> allproduct;

  @override
  State<AllProductListDamage> createState() => _AllProductListDamageState();
}

class _AllProductListDamageState extends State<AllProductListDamage> {
  final TextEditingController orderqty = TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = GlobalKey<FormState>();
  List<PReport> _allproduct = [];
  List<Damage> _damage = [];

  Damage damageProduct = Damage(
    damageId: 0,
    damageDate: DateTime.now(),
    supplier: "",
    medicineName: "",
    paking: 0,
    genericName: "",
    batchId: "",
    exDate: DateTime.now(),
    pursDate: DateTime.now(),
    invoice: "",
    returnQty: 0,
    purchaseRate: 0.0,
    status: "Damaged",
    purshasId: 0,
  );

  Future<bool> assignData() async {
    _allproduct = widget.allproduct;
    return _allproduct == widget.allproduct;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Damage",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DamagedCart(
                      damageList: _damage,
                    ),
                  ),
                );
              },
              child: Icon(Icons.shopping_cart),
            ),
          ],
        ),
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
              itemCount: _allproduct.length,
              itemBuilder: (context, index) {
                final allproduct = _allproduct[index];

                return ListTile(
                  leading: Text(allproduct.medicineName ?? 'Unknown'),
                  trailing: Text(
                    "Supplier: ${allproduct.supplier ?? 'Unknown'}, Batch: ${allproduct.batchId ?? 'Unknown'}",
                  ),
                  onTap: () async {
                    try {
                      await showTitleDialog();
                      var checked = false;
                      for (var i = 0; i < _damage.length; i++) {
                        if (_damage[i].batchId == allproduct.batchId) {
                          _damage[i].returnQty =
                              _damage[i].returnQty + int.parse(orderqty.text);
                          checked = true;
                          break;
                        }
                      }
                      if (!checked) {
                        damageProduct = Damage(
                          damageId: 0,
                          damageDate: DateTime.now(),
                          supplier: allproduct.supplier ?? '',
                          medicineName: allproduct.medicineName ?? '',
                          paking: allproduct.paking ?? 0,
                          genericName: allproduct.genericName ?? '',
                          batchId: allproduct.batchId ?? '',
                          exDate: allproduct.exDate ?? DateTime.now(),
                          pursDate: allproduct.pursDate ?? DateTime.now(),
                          invoice: allproduct.invoice ?? '',
                          returnQty: int.parse(orderqty.text),
                          purchaseRate: allproduct.purchaseRate ?? 0.0,
                          status: "Damaged",
                          purshasId: allproduct.purchaseId ?? 0,
                        );
                        _damage.add(damageProduct);
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Failed to fetch data: $e")),
                      );
                    }
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

  Future showTitleDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Form(
            key: _keyDialogForm,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(),
                  maxLength: 8,
                  textAlign: TextAlign.center,
                  onSaved: (val) {
                    orderqty.text = val.toString();
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Quantity';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                if (_keyDialogForm.currentState!.validate()) {
                  _keyDialogForm.currentState!.save();
                  Navigator.pop(context);
                }
              },
              child: Text('Ok'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
