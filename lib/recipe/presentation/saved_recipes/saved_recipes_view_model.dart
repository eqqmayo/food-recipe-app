import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/model/saved_recipes_ui_state.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;

  SavedRecipesUiState _state = const SavedRecipesUiState();
  SavedRecipesUiState get state => _state;

  SavedRecipesViewModel(this._getRecipesUseCase) {
    fetchSavedRecipes();
  }

  void fetchSavedRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      savedRecipes: await _getRecipesUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }
}
