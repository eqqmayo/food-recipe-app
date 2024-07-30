import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/core/domain/repository/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> execute() async {
    final recipes = await _recipeRepository.getRecipes();
    return List.unmodifiable(recipes);
  }
}
