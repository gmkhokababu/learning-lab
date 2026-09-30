class PreSale{
  int? stockId;
  String? medicineName;
  int? qty;
  double? rate;
  double? total;
  PreSale({
    required this.stockId,
    required this.medicineName,
    required this.qty,
    required this.rate,
    required this.total,
  });
  // factory PreSale.fromJson(Map<String, dynamic> json) => PreSale(
  //   medicineName: json['medicineName'],
  //   qty: json['qty'],
  //   rate: json['rate'],
  //   total: json['total'],
  // );
  // Map<String, dynamic> toJson() {
  //   return {
  //     "medicineName": medicineName,
  //     "qty": qty,
  //     "rate": rate,
  //     "total": total,
  //   };
  // }
}