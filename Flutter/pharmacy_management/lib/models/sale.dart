class Sale{
  int? saleId;
  int? stockId;
  int? qty;
  double? rate;
  double? total;
  String? saleDate;
  int? customerId;
  String? invoice_no;

  Sale({
    required this.saleId,
    required this.stockId,
    required this.qty,
    required this.rate,
    required this.total,
    required this.saleDate,
    required this.customerId,
    required this.invoice_no,
  });
  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
    saleId: json['saleId'],
    stockId: json['stockId'],
    qty: json['qty'],
    rate: json['rate'],
    total: json['total'],
    saleDate: json['saleDate'],
    customerId: json['customerId'],
    invoice_no: json['invoice_no'],
  );
  Map<String, dynamic> toJson() {
    return {
      "saleId": saleId,
      "stockId": stockId,
      "qty": qty,
      "rate": rate,
      "total": total,
      "saleDate": saleDate,
      "customerId": customerId,
      "invoice_no": invoice_no,
    };
  }
}