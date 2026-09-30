class Property {
  int? id;
  String? type;
  String? location;
  int? size;
  String? amenities;
  String? status;
  int? landlordId;
  int? price;
  String? saleType;
  String? landtype;
  Property(
      {required this.id,
      required this.type,
      required this.location,
      required this.size,
      required this.amenities,
      required this.status,
      required this.landlordId,
      required this.price,
      required this.saleType,
      required this.landtype});
  factory Property.fromJson(Map<String, dynamic> json) => Property(
      id: json['id'],
      type: json['type'],
      location: json['location'],
      size: json['size'],
      amenities: json['amenities'],
      status: json['status'],
      landlordId: json['landlordId'],
      price: json['price'],
      saleType: json['saleType'],
      landtype: json['landtype']);
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "location": location,
      "size": size,
      "amenities": amenities,
      "status": status,
      "landlordId": landlordId,
      "price": price,
      "saleType": saleType,
      "landtype": landtype,
    };
  }
}
