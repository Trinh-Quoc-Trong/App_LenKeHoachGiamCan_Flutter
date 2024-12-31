import 'package:json_annotation/json_annotation.dart';

part 'workout.g.dart';

@JsonSerializable()
class Workout {
  int id;
  String name;
  String description;
  int userId;
  DateTime createdAt;

  Workout(
      {required this.id,
      required this.name,
      required this.description,
      required this.userId,
      required this.createdAt});

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
