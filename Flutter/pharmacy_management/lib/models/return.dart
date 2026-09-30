import 'package:intl/intl.dart'; // For date formatting

class Return {
  int returnId;
  DateTime returnDate;
  String supplier;
  String medicineName;
  int paking;
  String genericName;
  String batchId;
  DateTime exDate;
  DateTime pursDate;
  String invoice;
  int returnQty;
  double purchaseRate;
  String status;
  int purshasId;

  Return({
    required this.returnId,
    required this.returnDate,
    required this.supplier,
    required this.medicineName,
    required this.paking,
    required this.genericName,
    required this.batchId,
    required this.exDate,
    required this.pursDate,
    required this.invoice,
    required this.returnQty,
    required this.purchaseRate,
    required this.status,
    required this.purshasId,
  });

  factory Return.fromJson(Map<String, dynamic> json) => Return(
    returnId: json['returnId'],
    returnDate: DateTime.parse(json['returnDate']), // Convert date string to DateTime
    supplier: json['supplier'],
    medicineName: json['medicineName'],
    paking: json['paking'],
    genericName: json['genericName'],
    batchId: json['batchId'],
    exDate: DateTime.parse(json['exDate']), // Convert date string to DateTime
    pursDate: DateTime.parse(json['pursDate']), // Convert date string to DateTime
    invoice: json['invoice'],
    returnQty: json['returnQty'],
    purchaseRate: json['purchaseRate'].toDouble(), // Ensure conversion to double
    status: json['status'],
    purshasId: json['purshasId'],
  );

  Map<String, dynamic> toJson() {
    return {
      "returnId": returnId,
      "returnDate": DateFormat('yyyy-MM-dd').format(returnDate), // Format DateTime as string
      "supplier": supplier,
      "medicineName": medicineName,
      "paking": paking,
      "genericName": genericName,
      "batchId": batchId,
      "exDate": DateFormat('yyyy-MM-dd').format(exDate), // Format DateTime as string
      "pursDate": DateFormat('yyyy-MM-dd').format(pursDate), // Format DateTime as string
      "invoice": invoice,
      "returnQty": returnQty,
      "purchaseRate": purchaseRate,
      "status": status,
      "purshasId": purshasId,
    };
  }
}
