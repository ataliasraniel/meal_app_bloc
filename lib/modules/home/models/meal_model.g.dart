// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealModelImpl _$$MealModelImplFromJson(Map<String, dynamic> json) =>
    _$MealModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      area: json['area'] as String,
      instructions: json['instructions'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$$MealModelImplToJson(_$MealModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'area': instance.area,
      'instructions': instance.instructions,
      'thumbnail': instance.thumbnail,
    };
