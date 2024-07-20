// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      recipeId: (json['recipeId'] as num).toInt(),
      image: json['image'] as String,
      name: json['name'] as String,
      weight: json['weight'] as String,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'recipeId': instance.recipeId,
      'image': instance.image,
      'name': instance.name,
      'weight': instance.weight,
    };
