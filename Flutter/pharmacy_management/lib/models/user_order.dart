class UserOrder {
  final int? orderId;
  final String? invoiceNO;
  final String? customerName;
  final String? customerPhone;
  final String? customerAddress;
  final DateTime? date;
  final int? totalOrder;

  UserOrder({
    this.orderId,
    this.invoiceNO,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.date,
    this.totalOrder,
  });

  factory UserOrder.fromJson(Map<String, dynamic> json) {
    return UserOrder(
      orderId: json['orderId'] as int?,
      invoiceNO: json['invoiceNO'] as String?,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      customerAddress: json['customerAddress'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      totalOrder: json['totalOrder'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'invoiceNO': invoiceNO,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerAddress': customerAddress,
      'date': date?.toIso8601String(),
      'totalOrder': totalOrder,
    };
  }

  @override
  String toString() {
    return 'UserOrder(orderId: $orderId, invoiceNO: $invoiceNO, customerName: $customerName, '
        'customerPhone: $customerPhone, customerAddress: $customerAddress, '
        'date: $date, totalOrder: $totalOrder)';
  }
}
