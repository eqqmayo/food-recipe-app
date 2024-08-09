import 'package:flutter/material.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/recipe_detail_ui_state.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/repository/ingredient_repository.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/repository/procedure_repository.dart';
import 'package:collection/collection.dart';

class RecipeDetailViewModel with ChangeNotifier {
  final IngredientRepository _ingredientRepository;
  final ProcedureRepository _procedureRepository;

  RecipeDetailUiState _state = const RecipeDetailUiState();
  RecipeDetailUiState get state => _state;

  RecipeDetailViewModel(
    this._ingredientRepository,
    this._procedureRepository,
  ) {
    fetchIngredients();
    fetchProcedures();
  }

  void fetchIngredients() async {
    _state = state.copyWith(
        ingredients: await _ingredientRepository.getIngredients());
    notifyListeners();
  }

  void fetchProcedures() async {
    _state =
        state.copyWith(procedures: await _procedureRepository.getProcedures());
    notifyListeners();
  }

  void getIngredients(int recipeId) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final ingredients = await _ingredientRepository.getIngredients();
    _state = state.copyWith(
        ingredients: ingredients
            .where((ingredient) => ingredient.recipeId == recipeId)
            .toList(),
        isLoading: false);
    notifyListeners();
  }

  void getProcedures(int recipeId) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final procedures = await _procedureRepository.getProcedures();
    _state = state.copyWith(
        procedures: procedures
            .where((procedure) => procedure.recipeId == recipeId)
            .sorted((a, b) => a.stepNum.compareTo(b.stepNum)),
        isLoading: false);
    notifyListeners();
  }
}
