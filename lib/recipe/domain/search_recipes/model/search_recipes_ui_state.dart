import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_ui_state.freezed.dart';

@freezed
class SearchRecipesUiState with _$SearchRecipesUiState {
  const factory SearchRecipesUiState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
  }) = _SearchRecipesUiState;
}
