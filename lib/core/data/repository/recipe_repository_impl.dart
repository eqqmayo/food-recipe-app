import 'package:food_recipe_app/core/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/core/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/core/domain/model/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();
    return List.unmodifiable(recipes);
  }
}
