import 'package:json_annotation/json_annotation.dart';  

part 'user_role.g.dart';  

@JsonSerializable()  
class UserRole {  
  int id;  
  int userId;  
  int roleId;  

  UserRole({required this.id, required this.userId, required this.roleId});  

  factory UserRole.fromJson(Map<String, dynamic> json) => _$UserRoleFromJson(json);  
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);  
}