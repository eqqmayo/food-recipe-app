import 'package:food_recipe_app/data/data_source/saved_recipes_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';

abstract interface class SavedRecipeRepository {
  Future<List<Recipe>> getSavedRecipes();
  Future<List<Recipe>> searchRecipes(String keyword);
}

class SavedRecipeRepositoryImpl implements SavedRecipeRepository {
  final SavedRecipeDataSource _savedRecipeDataSource;

  SavedRecipeRepositoryImpl(this._savedRecipeDataSource);

  @override
  Future<List<Recipe>> getSavedRecipes() async {
    final savedRecipes = await _savedRecipeDataSource.getSavedRecipes();
    return List.unmodifiable(savedRecipes);
  }

  @override
  Future<List<Recipe>> searchRecipes(String keyword) async {
    final savedRecipes = await _savedRecipeDataSource.searchRecipes(keyword);
    return List.unmodifiable(savedRecipes);
  }
}
