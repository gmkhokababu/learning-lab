import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:pharmacy_management/models/p_report.dart';

class ShowPurchaseDetails extends StatelessWidget {
  final PReport purchase;

  const ShowPurchaseDetails({Key? key, required this.purchase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create DateFormat instance to format dates
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Convert DateTime to String with format
    String formatDate(DateTime? date) => date != null ? dateFormat.format(date) : 'N/A';

    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Medicine Name: ${purchase.medicineName ?? 'N/A'}"),
            Text("Purchase Rate: ${purchase.purchaseRate?.toString() ?? 'N/A'}"),
            Text("Quantity: ${purchase.qty?.toString() ?? 'N/A'}"),
            Text("Total: ${(purchase.purchaseRate ?? 0.0) * (purchase.qty ?? 0)}"),
            Text("Batch ID: ${purchase.batchId ?? 'N/A'}"),
            Text("Expiry Date: ${formatDate(purchase.exDate)}"),
            Text("MRP: ${purchase.mrp?.toString() ?? 'N/A'}"),
            Text("Invoice: ${purchase.invoice ?? 'N/A'}"),
            Text("Packing: ${purchase.paking?.toString() ?? 'N/A'}"),
            Text("Generic Name: ${purchase.genericName ?? 'N/A'}"),
            Text("Supplier: ${purchase.supplier?.toString() ?? 'N/A'}"),
            Text("Purchase Date: ${formatDate(purchase.pursDate)}"),
            Text("Purchase ID: ${purchase.purchaseId?.toString() ?? 'N/A'}"),
          ],
        ),
      ),
    );
  }
}
