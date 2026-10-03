import 'package:intl/intl.dart'; // For date formatting

class SaleReport {
  String supplier;
  String medicine;
  String generic;
  String batch;
  String customer;
  String phone; // Updated to 'phone' to follow Dart naming conventions
  int qty;
  double rate;
  double total;
  DateTime date; // Use DateTime for date
  String invoiceNo; // Updated to 'invoiceNo' to follow Dart naming conventions

  SaleReport({
    required this.supplier,
    required this.medicine,
    required this.generic,
    required this.batch,
    required this.customer,
    required this.phone,
    required this.qty,
    required this.rate,
    required this.total,
    required this.date,
    required this.invoiceNo,
  });

  factory SaleReport.fromJson(Map<String, dynamic> json) => SaleReport(
    supplier: json['supplier'],
    medicine: json['medicine'],
    generic: json['generic'],
    batch: json['batch'],
    customer: json['customer'],
    phone: json['phone'],
    qty: json['qty'],
    rate: json['rate'].toDouble(), // Ensure conversion to double
    total: json['total'].toDouble(), // Ensure conversion to double
    date: DateTime.parse(json['date']), // Convert date string to DateTime
    invoiceNo: json['invoice_no'],
  );

  Map<String, dynamic> toJson() {
    return {
      "supplier": supplier,
      "medicine": medicine,
      "generic": generic,
      "batch": batch,
      "customer": customer,
      "phone": phone,
      "qty": qty,
      "rate": rate,
      "total": total,
      "date": DateFormat('yyyy-MM-dd').format(date), // Format DateTime as string
      "invoice_no": invoiceNo,
    };
  }
}
