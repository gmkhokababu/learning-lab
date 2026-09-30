import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/show_sales_details.dart';
import 'package:pharmacy_management/models/sale_report.dart';
import 'package:pharmacy_management/navigation/navigation.dart';

class ShowSalesReports extends StatefulWidget {
  const ShowSalesReports({super.key, required this.saleReport});
  final List<SaleReport> saleReport;

  @override
  State<ShowSalesReports> createState() => _ShowSalesReportsState();
}

class _ShowSalesReportsState extends State<ShowSalesReports> {
  late int _totalMedicine;
  late double _totalAmount;

  @override
  void initState() {
    super.initState();
    _calculateTotals();
  }

  void _calculateTotals() {
    _totalMedicine = widget.saleReport.fold(0, (sum, sale) {
      final qty = sale.qty ?? 0;
      return sum + qty;
    });
    _totalAmount = widget.saleReport.fold(0, (sum, sale) {
      final purchaseRate = sale.rate ?? 0.0;
      final qty = sale.qty ?? 0;
      return sum + (purchaseRate * qty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Nav(),
      appBar: AppBar(
        title: Text("Sale Report"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.teal[50],
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Medicines: $_totalMedicine',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total Amount: \$${_totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<bool>(
              future: Future.value(true), // Just a placeholder for now
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else if (snapshot.hasData && snapshot.data == true) {
                  return ListView.builder(
                    itemCount: widget.saleReport.length,
                    itemBuilder: (context, index) {
                      final sale = widget.saleReport[index];

                      // Ensure purchaseRate and qty are valid numbers
                      final purchaseRate = sale.rate ?? 0.0;
                      final qty = sale.qty ?? 0;

                      // Calculate total safely
                      final total = (purchaseRate * qty).toStringAsFixed(2);

                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        elevation: 5,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(10),
                          leading: Icon(Icons.medical_services, color: Colors.teal),
                          title: Text(sale.medicine ?? 'Unknown'),
                          subtitle: Text(
                            'Rate: \$${purchaseRate.toStringAsFixed(2)}\nQty: $qty',
                          ),
                          trailing: Text(
                            'Total: \$${total}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowSalesDetails(
                                  saleReport: sale,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
