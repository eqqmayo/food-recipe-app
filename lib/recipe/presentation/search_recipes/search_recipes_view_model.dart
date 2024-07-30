import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/model/search_recipes_ui_state.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/search_recipes_use_case.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchRecipesUiState _state = const SearchRecipesUiState();
  SearchRecipesUiState get state => _state;

  SearchRecipesViewModel(
    this._getRecipesUseCase,
    this._searchRecipesUseCase,
  ) {
    fetchRecipes();
  }

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _getRecipesUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String keyword) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _searchRecipesUseCase.execute(keyword);
    _state = state.copyWith(
      recipes: recipes,
      isLoading: false,
    );
    notifyListeners();
  }
}
