class Voucher {
  int voucherNumber;
  String heading;
  String description;
  double ammount;
  String status;
  int requesterId;

  Voucher({
    required this.voucherNumber,
    required this.heading,
    required this.description,
    required this.ammount,
    required this.status,
    required this.requesterId,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      voucherNumber: json['voucherNumber'],
      heading: json['heading'],
      description: json['description'],
      ammount: json['ammount'].toDouble(),
      status: json['status'],
      requesterId: json['requesterId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'voucherNumber': voucherNumber,
      'heading': heading,
      'description': description,
      'ammount': ammount,
      'status': status,
      'requesterId': requesterId,
    };
  }
}
