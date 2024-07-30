import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_ui_state.freezed.dart';

@freezed
class SavedRecipesUiState with _$SavedRecipesUiState {
  const factory SavedRecipesUiState({
    @Default([]) List<Recipe> savedRecipes,
    @Default(false) bool isLoading,
  }) = _SavedRecipesUiState;
}
