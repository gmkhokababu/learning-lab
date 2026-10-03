import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/processing_order_screen.dart';
import 'package:pharmacy_management/extension/date_format.dart';

import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/order_details.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_management/models/sale.dart';

List<Sale> objectsFromJson(String str) =>
    List<Sale>.from(json.decode(str).map((x) => Sale.fromJson(x)));
String objectsToJson(List<Sale> data) =>
    json.encode(List<Sale>.from(data.map((x) => x.toJson())));

class ProcessingOrderDetailsScreen extends StatefulWidget {
  final String invoiceNo;
  final String status;

  const ProcessingOrderDetailsScreen({
    required this.invoiceNo,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  State<ProcessingOrderDetailsScreen> createState() => _ProcessingOrderDetailsScreenState();
}

class _ProcessingOrderDetailsScreenState extends State<ProcessingOrderDetailsScreen> {
  Ipconfig i = Ipconfig();
  late Future<List<OrderDetails>> _futureOrderDetails;
   List<Sale> _sale=[];


  @override
  void initState() {
    super.initState();
    _futureOrderDetails = fetchOrderDetails();
  }

  List<Sale> assainSaleData(List<OrderDetails> od){
    _sale=[];
    try {
      for( int i=0;i<od.length;i++){
        Sale sale=Sale(
          saleId: 0,
          stockId: od[i].stockId,
          qty: od[i].qty,
          rate: od[i].rate,
          total: od[i].total,
          saleDate: DateFormat(date:od[i].saleDate).format().toString(),
          customerId: od[i].customerId,
          invoice_no: od[i].invoice,
        );
        _sale.add(sale);
      }

      return _sale;
    } catch (e) {
      throw Exception("Error Assain sale data: $e");
    }
  }
  Future<String> saveSale(List<Sale> sale) async {
    try {
      final response = await http.post(Uri.parse('${i.ip}save-sale'),
          body: jsonEncode(sale),
          headers: {"content-type": "application/json"});
      if (response.statusCode == 200) {
        // SnackBar s = SnackBar(content: Text("Get Data"));
        // ScaffoldMessenger.of(context).showSnackBar(s);
        return response.body;
      } else {
        throw Exception(
            "Failed to Save sale ${response.body}"); // Changed exception message to be more descriptive
      }
    }catch (e) {
      throw Exception("Error Save sale: $e");
    }
  }
  Future<List<OrderDetails>> fetchOrderDetails() async {
    try {
      final response = await http.get(
        Uri.parse('${i.ip}get-order-details/${widget.invoiceNo}/${widget.status}'),
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((detail) => OrderDetails.fromJson(detail)).toList();
      } else {
        throw Exception("Failed to load order details");
      }
    } catch (e) {
      throw Exception("Error fetching order details: $e");
    }
  }

  Future<void> updateOrderStatus(int id, String status) async {
    final response = await http.get(
      Uri.parse('${i.ip}update-order/$id/$status'),
    );

    if (response.statusCode == 200) {
      return; // Successfully updated the order status
    } else {
      throw Exception("Failed to update order status");
    }
  }

  void showOrderDetailsDialog(OrderDetails order) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Order Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Medicine: ${order.medicineName}"),
              Text("Supplier: ${order.supplier}"),
              Text("Quantity: ${order.qty}"),
              Text("Total: ${order.total?.toStringAsFixed(2)}"),
              // Add more details as needed
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await updateOrderStatus(order.orderId!, "Canceled");
                  showMessage("Order canceled successfully", "OK");
                } catch (e) {
                  showMessage("Failed to cancel order", "OK");
                }
              },
              child: Text("Cancel Order"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showConfirmationDialog(String action, String status) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog by tapping outside
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            bool isProcessing = false;

            return AlertDialog(
              title: Text("$action All Orders"),
              content: isProcessing
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(), // Show the progress indicator while processing
                  SizedBox(height: 20),
                  Text("Processing... Please wait."),
                ],
              )
                  : Text("Are you sure you want to $action all orders?"),
              actions: isProcessing
                  ? [] // Disable buttons while processing
                  : [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog immediately after "Cancel" is pressed
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isProcessing = true; // Show the progress indicator
                    });

                    try {
                      if (action == "Confirm") {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Processing orders...")));

                        List<OrderDetails> od = await fetchOrderDetails();
                        List<Sale> sale = await assainSaleData(od);

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("${sale.length} orders processed.")));

                        await saveSale(sale);
                      }

                      await processAllOrders(status, action);

                      // Show a success message after all tasks are done
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("All orders processed successfully.")));

                      Navigator.of(context).pop(); // Close the dialog

                      // Navigate back to ProcessingOrderScreen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ProcessingOrderScreen()),
                      );
                    } catch (e) {
                      if (mounted) {
                        // Show error message if something goes wrong
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error processing orders: $e")));
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }



  Future<void> processAllOrders(String status, String action) async {
    bool allSuccessful = true;
    for (OrderDetails order in (await _futureOrderDetails)) {
      try {
        await updateOrderStatus(order.orderId!, status);
      } catch (e) {
        allSuccessful = false;
        break;
      }
    }

    if (allSuccessful) {
      showMessage("All orders are $action.", "OK", redirect: true);
    } else {
      showMessage("Failed to $action all orders", "OK");
    }
  }

  void showMessage(String message, String buttonText, {bool redirect = false}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (redirect) {
                  Navigator.of(context).pop(); // Redirect to previous screen
                }
              },
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Processing Order Details"),
      ),
      body: FutureBuilder<List<OrderDetails>>(
        future: _futureOrderDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      OrderDetails order = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.blueGrey[50],
                        shadowColor: Colors.grey,
                        elevation: 4,
                        child: ListTile(
                          title: Text(order.medicineName ?? "Unknown Medicine"),
                          subtitle: Text("Supplier: ${order.supplier ?? "Unknown"}\nQuantity: ${order.qty}"),
                          trailing: Text("Total: ${order.total?.toStringAsFixed(2) ?? "0.00"}"),
                          onTap: () {
                            showOrderDetailsDialog(order);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showConfirmationDialog("Confirm", "Sold");
                        },
                        child: Text("Confirm All"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showConfirmationDialog("Cancel", "Canceled");
                        },
                        child: Text("Cancel All",

                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("No order details available"));
          }
        },
      ),
    );
  }
}
