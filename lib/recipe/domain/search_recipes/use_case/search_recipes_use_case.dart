import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';

class SearchRecipesUseCase {
  final GetRecipesUseCase _getRecipesUseCase;

  SearchRecipesUseCase(this._getRecipesUseCase);

  Future<List<Recipe>> execute(String keyword) async {
    final recipes = await _getRecipesUseCase.execute();
    return recipes
        .where((recipe) =>
            recipe.title.toLowerCase().contains(keyword.toLowerCase()) ||
            recipe.creator.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}
