import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final double totalAmount;
  PaymentScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Amount: \$${totalAmount.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiration Date (MM/YY)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Payment Successful'),
                    content: Text('Your payment of \$${totalAmount.toStringAsFixed(2)} has been processed.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
