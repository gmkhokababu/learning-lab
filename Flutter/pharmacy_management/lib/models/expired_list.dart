import 'package:flutter/foundation.dart';

class ExpiredList {
  final int? expiredId;
  final DateTime? insertDate;
  final String? supplier;
  final String? medicineName;
  final int? packing;
  final String? genericName;
  final String? batchId;
  final DateTime? exDate;
  final DateTime? pursDate;
  final String? invoice;
  final int? returnQty;
  final double? purchaseRate;
  final String? status;
  final int? purchaseId;

  ExpiredList({
    this.expiredId,
    this.insertDate,
    this.supplier,
    this.medicineName,
    this.packing,
    this.genericName,
    this.batchId,
    this.exDate,
    this.pursDate,
    this.invoice,
    this.returnQty,
    this.purchaseRate,
    this.status,
    this.purchaseId,
  });

  factory ExpiredList.fromJson(Map<String, dynamic> json) {
    return ExpiredList(
      expiredId: json['expiredId'] as int?,
      insertDate: json['insertDate'] != null
          ? DateTime.parse(json['insertDate'] as String)
          : null,
      supplier: json['supplier'] as String?,
      medicineName: json['medicineName'] as String?,
      packing: json['packing'] as int?,
      genericName: json['genericName'] as String?,
      batchId: json['batchId'] as String?,
      exDate: json['exDate'] != null
          ? DateTime.parse(json['exDate'] as String)
          : null,
      pursDate: json['pursDate'] != null
          ? DateTime.parse(json['pursDate'] as String)
          : null,
      invoice: json['invoice'] as String?,
      returnQty: json['returnQty'] as int?,
      purchaseRate: (json['purchaseRate'] as num?)?.toDouble(),
      status: json['status'] as String?,
      purchaseId: json['purchaseId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expiredId': expiredId,
      'insertDate': insertDate?.toIso8601String(),
      'supplier': supplier,
      'medicineName': medicineName,
      'packing': packing,
      'genericName': genericName,
      'batchId': batchId,
      'exDate': exDate?.toIso8601String(),
      'pursDate': pursDate?.toIso8601String(),
      'invoice': invoice,
      'returnQty': returnQty,
      'purchaseRate': purchaseRate,
      'status': status,
      'purchaseId': purchaseId,
    };
  }

  @override
  String toString() {
    return 'ExpiredList(expiredId: $expiredId, insertDate: $insertDate, supplier: $supplier, medicineName: $medicineName, packing: $packing, genericName: $genericName, batchId: $batchId, exDate: $exDate, pursDate: $pursDate, invoice: $invoice, returnQty: $returnQty, purchaseRate: $purchaseRate, status: $status, purchaseId: $purchaseId)';
  }
}
