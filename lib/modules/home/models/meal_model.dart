import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_model.freezed.dart';
part 'meal_model.g.dart';

@freezed
class MealModel with _$MealModel {
  const factory MealModel({required String id, required String name, required String category, required String area, required String instructions, required String thumbnail}) = _MealModel;

  factory MealModel.fromJson(Map<String, dynamic> json) => _$MealModelFromJson(json);
}
