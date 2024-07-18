import 'package:food_recipe_app/data/data_source/saved_recipes_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';

abstract interface class SavedRecipeRepository {
  Future<List<Recipe>> getSavedRecipes();
}

class SavedRecipeRepositoryImpl implements SavedRecipeRepository {
  final SavedRecipeDataSource _savedRecipeDataSource;

  SavedRecipeRepositoryImpl(this._savedRecipeDataSource);

  @override
  Future<List<Recipe>> getSavedRecipes() async {
    final savedRecipes = await _savedRecipeDataSource.getSavedRecipes();
    return List.unmodifiable(savedRecipes);
  }
}
