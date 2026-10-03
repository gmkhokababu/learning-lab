import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/order_details_screen.dart';
import 'package:pharmacy_management/admin/processing_order_details_screen.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/user_order.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pharmacy_management/navigation/navigation.dart';


class ProcessingOrderScreen extends StatefulWidget {
  const ProcessingOrderScreen({super.key});

  @override
  State<ProcessingOrderScreen> createState() => _ProcessingOrderScreenState();
}

class _ProcessingOrderScreenState extends State<ProcessingOrderScreen> {
  Ipconfig i = Ipconfig();
  late Future<List<UserOrder>> _futureOrders;

  @override
  void initState() {
    super.initState();
    _futureOrders = fetchOrders();
  }

  Future<List<UserOrder>> fetchOrders() async {
    try {
      final response = await http.get(
        Uri.parse('${i.ip}get-order/Processing'),
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((order) => UserOrder.fromJson(order)).toList();
      } else {
        throw Exception("Failed to load orders");
      }
    } catch (e) {
      throw Exception("Error fetching orders: $e");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text("Processing Orders"),
      ),
      body: FutureBuilder<List<UserOrder>>(
        future: _futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data != null) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  _futureOrders = fetchOrders(); // Reload the orders
                });
                await _futureOrders; // Wait for the fetch to complete
              },
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  UserOrder order = snapshot.data![index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    color: Colors.blueGrey[50],
                    shadowColor: Colors.grey,
                    elevation: 4,
                    child: ListTile(
                      title: Text(order.customerName ?? "Unknown"),
                      subtitle: Text("Invoice No: ${order.invoiceNO ?? "N/A"}"),
                      trailing: Text("Total: ${order.totalOrder ?? 0}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProcessingOrderDetailsScreen(
                                  invoiceNo: order.invoiceNO ?? "",
                                  status: "Processing",
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("No orders available"));
          }
        },
      ),
    );
  }
}