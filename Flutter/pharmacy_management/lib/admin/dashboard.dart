import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_management/admin/expired_screen.dart';
import 'package:pharmacy_management/admin/order_screen.dart';
import 'package:pharmacy_management/admin/processing_order_screen.dart';
import 'package:pharmacy_management/admin/sales.dart';
import 'package:pharmacy_management/admin/show_damage_list.dart';
import 'package:pharmacy_management/admin/show_sales_reports.dart';
import 'package:pharmacy_management/ipset/ipconfig.dart';
import 'package:pharmacy_management/models/sale_report.dart';
import 'package:pharmacy_management/navigation/navigation.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Ipconfig i = Ipconfig();
  int stockCount = 0;
  int damageCount = 0;
  int expiredCount = 0;
  int soldCount = 0;
  int ordersCount = 0;
  int processingOrdersCount = 0;
  List<SaleReport> salereport=[];

  @override
  void initState() {
    super.initState();
    fetchStockCount();
    fetchDamageCount();
    fetchExpiredCount();
    fetchSoldCount();
    fetchOrdersCount();
    fetchProcessingOrdersCount();
  }

  Future<void> fetchStockCount() async {
    try {
      final response = await http.get(Uri.parse('${i.ip}get-all-stock-data'));
      if (response.statusCode == 200) {
        setState(() {
          stockCount = json
              .decode(response.body)
              .length;
        });
      } else {
        showError("Failed to load stock data");
      }
    }catch(error){
      print(error);
    }
  }

  Future<void> fetchDamageCount() async {
    final response = await http.get(Uri.parse('${i.ip}get-damage'));
    if (response.statusCode == 200) {
      setState(() {
        damageCount = json.decode(response.body).length;
      });
    } else {
      showError("Failed to load damage data");
    }
  }

  Future<void> fetchExpiredCount() async {
    final response = await http.get(Uri.parse('${i.ip}get-expired'));
    if (response.statusCode == 200) {
      setState(() {
        expiredCount = json.decode(response.body).length;
      });
    } else {
      showError("Failed to load expired data");
    }
  }

  Future<void> fetchSoldCount() async {
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month}-${now.day}";
    final response = await http.get(Uri.parse('${i.ip}sale-report/$formattedDate/$formattedDate/null'));
    if (response.statusCode == 200) {
      setState(() {
        soldCount = json.decode(response.body).length;
        salereport=json.decode(response.body);
      });
    } else {
      showError("Failed to load sold data");
    }
  }

  Future<void> fetchOrdersCount() async {
    final response = await http.get(Uri.parse('${i.ip}get-order/Requested'));
    if (response.statusCode == 200) {
      setState(() {
        ordersCount = json.decode(response.body).length;
      });
    } else {
      showError("Failed to load orders data");
    }
  }

  Future<void> fetchProcessingOrdersCount() async {
    final response = await http.get(Uri.parse('${i.ip}get-order/Processing'));
    if (response.statusCode == 200) {
      setState(() {
        processingOrdersCount = json.decode(response.body).length;
      });
    } else {
      showError("Failed to load processing orders data");
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          buildDashboardCard('Stock', stockCount, Icons.inventory, Colors.blue, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Sales()));
          }),
          buildDashboardCard('Damage', damageCount, Icons.error, Colors.red, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowDamageList()));
          }),
          buildDashboardCard('Expired', expiredCount, Icons.warning, Colors.orange, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExpiredScreen()));
          }),
          buildDashboardCard('Sold', soldCount, Icons.attach_money, Colors.green, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShowSalesReports(saleReport: salereport)));
          }),
          buildDashboardCard('Orders', ordersCount, Icons.list_alt, Colors.purple, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderScreen()));
          }),
          buildDashboardCard('Processing Orders', processingOrdersCount, Icons.loop, Colors.teal, () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessingOrderScreen()));
          }),
        ],
      ),
    );
  }

  Widget buildDashboardCard(String title, int count, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      margin: EdgeInsets.all(10.0),
      color: color.withOpacity(0.1),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40, color: color),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: color),
              ),
              SizedBox(height: 10.0),
              Text(
                count.toString(),
                style: TextStyle(fontSize: 18.0, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
