import 'package:flutter/material.dart';
import 'package:pharmacy_management/user/user_order_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            buildCard('Order', Icons.shopping_cart, Colors.blue, () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=> UserOrderScreen()));
              // Handle navigation to Order screen or functionality here
            }),
            buildCard('Order Status', Icons.check_circle, Colors.green, () {
              // Handle navigation to Order Status screen or functionality here
            }),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 60.0, color: color),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
