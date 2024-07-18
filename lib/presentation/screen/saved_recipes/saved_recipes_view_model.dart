import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/saved_recipes_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final SavedRecipeRepository _savedRecipeRepository;

  SavedRecipesViewModel(this._savedRecipeRepository) {
    fetchSavedRecipes();
  }

  List<Recipe> _savedRecipes = [];
  List<Recipe> get savedRecipes => _savedRecipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    _savedRecipes = await _savedRecipeRepository.getSavedRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
