import 'package:employee_management/navigation/user_nav.dart';
import 'package:flutter/material.dart';

class VouchersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNav(),
      appBar: AppBar(
        title: Text('Vouchers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCardButton(context, 'Add Voucher', Icons.add, () {
              // Navigate to Add Voucher screen
              Navigator.pushNamed(context, '/addVoucher');
            }),
            SizedBox(height: 20),
            _buildCardButton(context, 'Show Voucher Status', Icons.list, () {
              // Navigate to Show Voucher Status screen
              Navigator.pushNamed(context, '/showVoucherStatus');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCardButton(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 40, color: Colors.blueAccent),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
