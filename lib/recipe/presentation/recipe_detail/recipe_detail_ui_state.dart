import 'package:food_recipe_app/recipe/domain/recipe_detail/model/ingredient.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/model/procedure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_detail_ui_state.freezed.dart';

@freezed
class RecipeDetailUiState with _$RecipeDetailUiState {
  const factory RecipeDetailUiState({
    @Default([]) List<Ingredient> ingredients,
    @Default([]) List<Procedure> procedures,
    @Default(false) bool isLoading,
  }) = _RecipeDetailUiState;
}
