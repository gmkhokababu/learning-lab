class Stock{
  int? stockId;
  String? medicineName;
  int? paking;
  String? genericName;
  String? batchId;
  String? ex_date;
  String? supplier;
  int? qty;
  String? mrp;
  double? rate;
  Stock({
    required this.stockId,
    required this.medicineName,
    required this.paking,
    required this.genericName,
    required this.batchId,
    required this.ex_date,
    required this.supplier,
    required this.qty,
    required this.mrp,
    required this.rate,
  });
  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
    stockId: json['stockId'],
    medicineName: json['medicineName'],
    paking: json['paking'],
    genericName: json['genericName'],
    batchId: json['batchId'],
    ex_date: json['ex_date'],
    supplier: json['supplier'],
    qty: json['qty'],
    mrp: json['mrp'],
    rate: json['rate'],

  );
  Map<String, dynamic> toJson() {
    return {
      "stockId": stockId,
      "medicineName": medicineName,
      "paking": paking,
      "genericName": genericName,
      "batchId": batchId,
      "ex_date": ex_date,
      "supplier": supplier,
      "qty": qty,
      "mrp": mrp,
      "rate": rate,
    };
  }
}