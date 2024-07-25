import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/ui_state/saved_recipes_ui_state.dart';
import 'package:food_recipe_app/data/repository/saved_recipes_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final SavedRecipeRepository _savedRecipeRepository;

  SavedRecipesUiState _state = const SavedRecipesUiState();
  SavedRecipesUiState get state => _state;

  SavedRecipesViewModel(this._savedRecipeRepository) {
    fetchSavedRecipes();
  }

  void fetchSavedRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      savedRecipes: await _savedRecipeRepository.getSavedRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }
}
