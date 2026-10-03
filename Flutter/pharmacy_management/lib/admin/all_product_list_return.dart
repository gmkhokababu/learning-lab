import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/return_cart.dart';
import 'package:pharmacy_management/models/p_report.dart';
import 'package:pharmacy_management/models/return.dart';
import 'package:pharmacy_management/navigation/navigation.dart';
import 'package:intl/intl.dart'; // Importing the intl package

class AllProductListReturn extends StatefulWidget {
  const AllProductListReturn({super.key, required this.allproduct});
  final List<PReport> allproduct;

  @override
  State<AllProductListReturn> createState() => _AllProductListReturnState();
}

class _AllProductListReturnState extends State<AllProductListReturn> {
  final TextEditingController orderqty = TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();
  List<PReport> _allproduct = [];
  List<Return> _return = [];

  Return returnProduct = Return(
      returnId: 0,
      returnDate: DateTime.now(),
      supplier: "",
      medicineName: "",
      paking: 0,
      genericName: "",
      batchId: "",
      exDate: DateTime.now(),
      pursDate: DateTime.now(),
      invoice: "",
      returnQty: 0,
      purchaseRate: 0,
      status: "Returend",
      purshasId: 0);

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
              "Return",
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReturnCart(
                          returnList: _return,

                        )));
              },
              child: Icon(Icons.shopping_cart),
              // style: ,
            )
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
                    "Supplier: ${allproduct.supplier ?? 'Unknown'},  Batch: ${allproduct.batchId ?? 'Unknown'}",
                  ),
                  onTap: () async {
                    await showTitleDialog();
                    var checked = false;
                    for (var i = 0; i < _return.length; i++) {
                      if (_return[i].batchId == _allproduct[index].batchId) {
                        _return[i].returnQty =
                            _return[i].returnQty! + int.parse(orderqty.text);
                        checked = true;
                      }
                    }
                    if (checked != true) {
                      returnProduct = Return(
                          returnId: 0,
                          returnDate: DateTime.now(),
                          supplier: _allproduct[index].supplier!,
                          medicineName: _allproduct[index].medicineName!,
                          paking: _allproduct[index].paking!,
                          genericName: _allproduct[index].genericName!,
                          batchId: _allproduct[index].batchId!,
                          exDate: _allproduct[index].exDate!,
                          pursDate: _allproduct[index].pursDate!,
                          invoice: _allproduct[index].invoice!,
                          returnQty:int.parse(orderqty.text),
                          purchaseRate: _allproduct[index].purchaseRate!,
                          status: "Returend",
                          purshasId: _allproduct[index].purchaseId!);
                      _return.add(returnProduct);
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
                    decoration: const InputDecoration(
                        // icon: Icon(Icons.ac_unit),
                        ),
                    maxLength: 8,
                    textAlign: TextAlign.center,
                    onSaved: (val) {
                      orderqty.text = val.toString();
                      setState(() {});
                    },
                    // autovalidate: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Quantity';
                      }

                      return null;
                    },
                  )
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
                // color: Colors.blue,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
            ],
          );
        });
  }
}
