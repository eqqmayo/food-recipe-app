import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';

class GetRecipesByCategoryUseCase {
  final GetRecipesUseCase _getRecipesUseCase;

  GetRecipesByCategoryUseCase(this._getRecipesUseCase);

  Future<List<Recipe>> execute(String category) async {
    final recipes = await _getRecipesUseCase.execute();
    return recipes.where((recipe) => recipe.category == category).toList();
  }
}
