
// models/role.dart
class Role {
  final int roleId;
  final String roleName;

  Role({required this.roleId, required this.roleName});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json['roleId'],
      roleName: json['roleName'],
    );
  }
}