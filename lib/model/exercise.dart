import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  int id;
  String name;
  String description;
  double caloriesBurnedPerRep;
  String muscleGroup;

  Exercise(
      {required this.id,
      required this.name,
      required this.description,
      required this.caloriesBurnedPerRep,
      required this.muscleGroup});

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
