class User{
  int? admin_id;
  String? admin_name;
  String? admin_email;
  String? admin_pass;

  User({this.admin_id, this.admin_name, this.admin_email, this.admin_pass});

  factory User.fromJson(Map<String,dynamic> json) => User(
    admin_id: json["admin_id"],
    admin_name : json["admin_name"],
    admin_email: json["admin_email"],
    admin_pass: json["admin_pass"],
  );

  Map<String,dynamic> toJson(){
    return {
      "admin_id" : admin_id,
      "admin_name" : admin_name,
      "admin_email" : admin_email,
      "admin_pass" : admin_pass,
    };
  }


}