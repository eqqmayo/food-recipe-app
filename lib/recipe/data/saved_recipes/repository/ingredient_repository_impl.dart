import 'package:food_recipe_app/recipe/data/saved_recipes/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/model/ingredient.dart';
import 'package:food_recipe_app/recipe/domain/saved_recipes/repository/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _ingredientDataSource;

  IngredientRepositoryImpl(this._ingredientDataSource);

  @override
  Future<List<Ingredient>> getIngredients() async {
    final ingredients = await _ingredientDataSource.getIngredients();
    return List.unmodifiable(ingredients);
  }
}
