import 'package:intl/intl.dart';

class Damage {
  int damageId;
  DateTime damageDate;
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

  Damage({
    required this.damageId,
    required this.damageDate,
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

  factory Damage.fromJson(Map<String, dynamic> json) => Damage(
    damageId: json['damageId'],
    damageDate: DateTime.parse(json['damageDate']),
    supplier: json['supplier'],
    medicineName: json['medicineName'],
    paking: json['paking'],
    genericName: json['genericName'],
    batchId: json['batchId'],
    exDate: DateTime.parse(json['exDate']),
    pursDate: DateTime.parse(json['pursDate']),
    invoice: json['invoice'],
    returnQty: json['returnQty'],
    purchaseRate: json['purchaseRate'],
    status: json['status'],
    purshasId: json['purshasId'],
  );

  Map<String, dynamic> toJson() {
    return {
      'damageId': damageId,
      'damageDate': damageDate.toIso8601String(),
      'supplier': supplier,
      'medicineName': medicineName,
      'paking': paking,
      'genericName': genericName,
      'batchId': batchId,
      'exDate': exDate.toIso8601String(),
      'pursDate': pursDate.toIso8601String(),
      'invoice': invoice,
      'returnQty': returnQty,
      'purchaseRate': purchaseRate,
      'status': status,
      'purshasId': purshasId,
    };
  }
}
