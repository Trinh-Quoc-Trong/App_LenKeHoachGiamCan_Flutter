import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String password;
  DateTime dateOfBirth;
  DateTime createdAt;
  DateTime updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.dateOfBirth,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
