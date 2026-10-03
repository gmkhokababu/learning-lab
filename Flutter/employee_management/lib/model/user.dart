class User{
  int? userId;
  String? userName;
  String? password;
  int? employeeId;
  User({
    required this.userId,
    required this.userName,
    required this.password,
    required this.employeeId,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['userId'],
    userName: json['userName'],
    password: json['password'],
    employeeId: json['employeeId'],
  );
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "password": password,
      "employeeId": employeeId,
    };
  }
}