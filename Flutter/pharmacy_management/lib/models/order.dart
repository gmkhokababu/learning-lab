import 'package:intl/intl.dart';

class Order {
   int orderId;
   int stockId;
   int? qty;
   double? rate;
   double? total;
   DateTime saleDate;
   int customerId;
   String? invoiceNo;
   String status;

  Order({
    required this.orderId,
    required this.stockId,
    required this.qty,
    this.rate,
    this.total,
    required this.saleDate,
    required this.customerId,
    this.invoiceNo,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'] as int,
      stockId: json['stockId'] as int,
      qty: json['qty'] as int,
      rate: (json['rate'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      saleDate: DateTime.parse(json['saleDate'] as String),
      customerId: json['customerId'] as int,
      invoiceNo: json['invoice_no'] as String?,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'stockId': stockId,
      'qty': qty,
      'rate': rate,
      'total': total,
      'saleDate': DateFormat('yyyy-MM-dd').format(saleDate),
      'customerId': customerId,
      'invoice_no': invoiceNo,
      'status': status,
    };
  }

  @override
  String toString() {
    return 'Order(orderId: $orderId, stockId: $stockId, qty: $qty, rate: $rate, total: $total, saleDate: $saleDate, customerId: $customerId, invoiceNo: $invoiceNo, status: $status)';
  }
}
