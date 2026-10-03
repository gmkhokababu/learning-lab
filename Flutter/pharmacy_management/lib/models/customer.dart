class Customer{
  int? customerId;
  String? name;
  String? phone;
  String? email;
  String? address;

  Customer({
    required this.customerId,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json['customerId'],
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
    address: json['address'],
  );
  Map<String, dynamic> toJson() {
    return {
      "customerId": customerId,
      "name": name,
      "phone": phone,
      "email": email,
      "address": address,
    };
  }
}