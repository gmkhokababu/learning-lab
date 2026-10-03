class Purchase{
  int? purshasId;
  String? pursDate;
  int? supllierId;
  String? medicineName;
  int? paking;
  String? genericName;
  String? batchId;
  String? exDate;
  int? qty;
  String? mrp;
  double? purchaseRate;
  String? invoice;


  Purchase({
    required this.purshasId,
    required this.pursDate,
    required this.supllierId,
    required this.medicineName,
    required this.paking,
    required this.genericName,
    required this.batchId,
    required this.exDate,
    required this.qty,
    required this.mrp,
    required this.purchaseRate,
    required this.invoice,
  });
  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
    purshasId: json['purshasId'],
    pursDate: json['pursDate'],
    supllierId: json['supllierId'],
    medicineName: json['medicineName'],
    paking: json['paking'],
    genericName: json['genericName'],
    batchId: json['batchId'],
    exDate: json['exDate'],
    qty: json['qty'],
    mrp: json['mrp'],
    // purchaseRate: json['purchaseRate'],
    purchaseRate: (json['purchaseRate'] as num?)?.toDouble(), // Ensure conversion to double
    invoice: json['invoice'],
  );
  Map<String, dynamic> toJson() {
    return {
      "purshasId": purshasId,
      "pursDate": pursDate,
      "supllierId": supllierId,
      "medicineName": medicineName,
      "paking": paking,
      "genericName": genericName,
      "batchId": batchId,
      "exDate": exDate,
      "qty": qty,
      "mrp": mrp,
      "purchaseRate": purchaseRate,
      "invoice": invoice,
    };
  }


}