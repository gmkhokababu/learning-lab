class Tenant{
  int? id;
  String? name;
  String? presentAddress;
  String? permanentAddress;
  String? phoneNo;
  String? email;
  String? occupation;
  String? propertyId;
  Tenant({
    required this.id,
    required this.name,
    required this.presentAddress,
    required this.permanentAddress,
    required this.phoneNo,
    required this.email,
    required this.occupation,
    required this.propertyId,

  });
  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
    id: json['id'],
    name: json['name'],
    presentAddress: json['presentAddress'],
    permanentAddress: json['permanentAddress'],
    phoneNo: json['phoneNo'],
    email: json['email'],
    occupation: json['occupation'],
    propertyId: json['propertyId'],
  );
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "presentAddress": presentAddress,
      "permanentAddress": permanentAddress,
      "phoneNo": phoneNo,
      "email": email,
      "occupation": occupation,
      "propertyId": propertyId,
    };
  }
}