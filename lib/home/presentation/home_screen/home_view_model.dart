import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/home/domain/home_screen/use_case/get_recipes_by_category_use_case.dart';
import 'package:food_recipe_app/home/presentation/home_screen/home_ui_state.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  final GetRecipesByCategoryUseCase _getRecipesByCategoryUseCase;

  final _streamController = StreamController<String>();
  Stream<String> get categoryStream => _streamController.stream;

  HomeUiState _state = const HomeUiState();
  HomeUiState get state => _state;

  HomeViewModel(
    this._getRecipesUseCase,
    this._getRecipesByCategoryUseCase,
  ) {
    fetchRecipes();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
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

  void onSelectedCategory(String category) async {
    _streamController.add(category);

    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _getRecipesByCategoryUseCase.execute(category),
      isLoading: false,
    );
    notifyListeners();
  }
}
