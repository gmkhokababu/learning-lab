import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/order_details.dart';
import 'package:http/http.dart' as http;

class OrderDetailsScreen extends StatefulWidget {
  final String invoiceNo;
  final String status;

  const OrderDetailsScreen({
    required this.invoiceNo,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Ipconfig i = Ipconfig();
  late Future<List<OrderDetails>> _futureOrderDetails;

  @override
  void initState() {
    super.initState();
    _futureOrderDetails = fetchOrderDetails();
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
      builder: (context) {
        return AlertDialog(
          title: Text("$action All Orders"),
          content: Text("Are you sure you want to $action all orders?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await processAllOrders(status, action);
              },
              child: Text("OK"),
            ),
          ],
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
        title: Text("Order Details"),
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
                          showConfirmationDialog("Confirm", "Processing");
                        },
                        child: Text("Confirm All"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showConfirmationDialog("Cancel", "Canceled");
                        },
                        child: Text("Cancel All"),
                        style: ElevatedButton.styleFrom(
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
