import 'package:flutter/material.dart';
import 'package:pharmacy_management/models/sale_report.dart';
import 'package:intl/intl.dart'; // Import the intl package

class ShowSalesDetails extends StatelessWidget {
  const ShowSalesDetails({super.key, required this.saleReport});
  final SaleReport saleReport;

  @override
  Widget build(BuildContext context) {
    // Create DateFormat instance to format dates
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    // Convert DateTime to String with format
    String formatDate(DateTime? date) => date != null ? dateFormat.format(date) : 'N/A';

    return Scaffold(
      appBar: AppBar(
        title: Text("Sale Details"),
        backgroundColor: Colors.teal, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invoice: ${saleReport.invoiceNo ?? 'N/A'}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Customer Name: ${saleReport.customer ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Phone No: ${saleReport.phone ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Sale Date: ${formatDate(saleReport.date)}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Medicine Name: ${saleReport.medicine ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Generic Name: ${saleReport.generic ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Supplier: ${saleReport.supplier ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Batch ID: ${saleReport.batch ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Quantity: ${saleReport.qty?.toString() ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Sale Price: ${saleReport.rate?.toString() ?? 'N/A'}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Total: ${saleReport.total?.toString() ?? '0.0'}",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
