import 'package:json_annotation/json_annotation.dart';

part 'user_health_log.g.dart';

@JsonSerializable()
class UserHealthLog {
  int id;
  int userId;
  double weight;
  double height;
  double goalWeight;
  DateTime createdAt;

  UserHealthLog(
      {required this.id,
      required this.userId,
      required this.weight,
      required this.height,
      required this.goalWeight,
      required this.createdAt});

  factory UserHealthLog.fromJson(Map<String, dynamic> json) =>
      _$UserHealthLogFromJson(json);
  Map<String, dynamic> toJson() => _$UserHealthLogToJson(this);
}
