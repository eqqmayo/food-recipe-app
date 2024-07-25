import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/ui_state/search_recipes_ui_state.dart';
import 'package:food_recipe_app/data/repository/saved_recipes_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final SavedRecipeRepository _savedRecipeRepository;

  SearchRecipesUiState _state = const SearchRecipesUiState();
  SearchRecipesUiState get state => _state;

  SearchRecipesViewModel(this._savedRecipeRepository) {
    fetchRecipes();
  }

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _savedRecipeRepository.getSavedRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String keyword) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _savedRecipeRepository.getSavedRecipes();
    _state = state.copyWith(
      recipes: recipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(keyword.toLowerCase()) ||
              recipe.creator.toLowerCase().contains(keyword.toLowerCase()))
          .toList(),
      isLoading: false,
    );

    notifyListeners();
  }
}
