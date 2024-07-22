import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';
import 'package:food_recipe_app/data/model/procedure.dart';
import 'package:food_recipe_app/data/repository/ingredient_repository.dart';
import 'package:food_recipe_app/data/repository/procedure_repository.dart';
import 'package:collection/collection.dart';

class RecipeDatailViewModel with ChangeNotifier {
  final IngredientRepository _ingredientRepository;
  final ProcedureRepository _procedureRepository;

  RecipeDatailViewModel(
    this._ingredientRepository,
    this._procedureRepository,
  ) {
    fetchIngredients();
    fetchProcedures();
  }

  List<Ingredient> _ingredients = [];
  List<Ingredient> get ingredients => _ingredients;

  List<Procedure> _procedures = [];
  List<Procedure> get procedures => _procedures;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchIngredients() async {
    _ingredients = await _ingredientRepository.getIngredients();
  }

  void fetchProcedures() async {
    _procedures = await _procedureRepository.getProcedures();
  }

  void getIngredients(int recipeId) async {
    _isLoading = true;
    notifyListeners();

    final ingredients = await _ingredientRepository.getIngredients();
    _ingredients = ingredients
        .where((ingredient) => ingredient.recipeId == recipeId)
        .toList();

    _isLoading = false;
    notifyListeners();
  }

  void getProcedures(int recipeId) async {
    _isLoading = true;
    notifyListeners();

    final procedures = await _procedureRepository.getProcedures();
    _procedures = procedures
        .where((procedure) => procedure.recipeId == recipeId)
        .sorted((a, b) => a.stepNum.compareTo(b.stepNum));

    _isLoading = false;
    notifyListeners();
  }
}
