class OrderDetails {
  String? invoice;
  String? medicineName;
  String? genericName;
  String? supplier;
  int? qty;
  double? rate;
  double? total;
  String? customerName;
  String? phone;
  String? address;
  int? stockId;
  int? orderId;
  DateTime? saleDate;
  String? status;
  int? customerId;

  OrderDetails({
    this.invoice,
    this.medicineName,
    this.genericName,
    this.supplier,
    this.qty,
    this.rate,
    this.total,
    this.customerName,
    this.phone,
    this.address,
    this.stockId,
    this.orderId,
    this.saleDate,
    this.status,
    this.customerId,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      invoice: json['invoice'] as String?,
      medicineName: json['medicineName'] as String?,
      genericName: json['genericName'] as String?,
      supplier: json['supplier'] as String?,
      qty: json['qty'] as int?,
      rate: (json['rate'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      customerName: json['customerName'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      stockId: json['stockId'] as int?,
      orderId: json['orderId'] as int?,
      saleDate: json['saleDate'] != null ? DateTime.parse(json['saleDate']) : null,
      status: json['status'] as String?,
      customerId: json['customerId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoice': invoice,
      'medicineName': medicineName,
      'genericName': genericName,
      'supplier': supplier,
      'qty': qty,
      'rate': rate,
      'total': total,
      'customerName': customerName,
      'phone': phone,
      'address': address,
      'stockId': stockId,
      'orderId': orderId,
      'saleDate': saleDate?.toIso8601String(),
      'status': status,
      'customerId': customerId,
    };
  }

  @override
  String toString() {
    return 'OrderDetails(invoice: $invoice, medicineName: $medicineName, genericName: $genericName, supplier: $supplier, qty: $qty, rate: $rate, total: $total, customerName: $customerName, phone: $phone, address: $address, stockId: $stockId, orderId: $orderId, saleDate: $saleDate, status: $status, customerId: $customerId)';
  }
}
