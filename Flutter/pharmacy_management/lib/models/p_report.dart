import 'package:intl/intl.dart'; // Importing the intl package for date formatting

class PReport {
  DateTime? pursDate; // Updated to DateTime
  String? supplier; // Changed from 'supllierId' to 'supplier' for clarity
  String? medicineName;
  int? paking;
  String? genericName;
  String? batchId;
  DateTime? exDate; // Updated to DateTime
  int? qty;
  int? mrp;
  double? purchaseRate;
  String? invoice;
  int? purchaseId; // Changed from 'purshasId' to 'purchaseId' for consistency

  PReport({
    required this.pursDate,
    required this.supplier,
    required this.medicineName,
    required this.paking,
    required this.genericName,
    required this.batchId,
    required this.exDate,
    required this.qty,
    required this.mrp,
    required this.purchaseRate,
    required this.invoice,
    required this.purchaseId,
  });

  factory PReport.fromJson(Map<String, dynamic> json) => PReport(
    pursDate: DateTime.parse(json['pursDate']), // Parsing DateTime
    supplier: json['supplier'],
    medicineName: json['medicineName'],
    paking: json['paking'],
    genericName: json['genericName'],
    batchId: json['batchId'],
    exDate: DateTime.parse(json['exDate']), // Parsing DateTime
    qty: json['qty'],
    mrp: json['mrp'],
    purchaseRate: json['purchaseRate'].toDouble(), // Ensure it's a double
    invoice: json['invoice'],
    purchaseId: json['purchaseId'],
  );

  Map<String, dynamic> toJson() {
    return {
      "pursDate": DateFormat('yyyy-MM-dd').format(pursDate!), // Formatting DateTime
      "supplier": supplier,
      "medicineName": medicineName,
      "paking": paking,
      "genericName": genericName,
      "batchId": batchId,
      "exDate": DateFormat('yyyy-MM-dd').format(exDate!), // Formatting DateTime
      "qty": qty,
      "mrp": mrp,
      "purchaseRate": purchaseRate,
      "invoice": invoice,
      "purchaseId": purchaseId,
    };
  }
}
