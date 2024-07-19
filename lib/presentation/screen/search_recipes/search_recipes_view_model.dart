import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/saved_recipes_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final SavedRecipeRepository _savedRecipeRepository;

  SearchRecipesViewModel(this._savedRecipeRepository) {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _savedRecipeRepository.getSavedRecipes();
    _isLoading = false;
    notifyListeners();
  }

  void searchRecipes(String keyword) async {
    _isLoading = true;
    notifyListeners();

    final recipes = await _savedRecipeRepository.getSavedRecipes();
    _recipes = recipes
        .where((recipe) =>
            recipe.title.toLowerCase().contains(keyword.toLowerCase()) ||
            recipe.creator.toLowerCase().contains(keyword.toLowerCase()))
        .toList();

    _isLoading = false;
    notifyListeners();
  }
}
