class User {
  int? id;
  String? name;
  String? email;
  String? userName;
  String? password;
  String? role;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.password,
    required this.role,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        userName: json['userName'],
        password: json['password'],
        role: json['role'],
      );
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "userName": userName,
      "password": password,
      "role": role,
    };
  }
}
