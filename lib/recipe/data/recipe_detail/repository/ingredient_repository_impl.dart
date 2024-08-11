import 'package:food_recipe_app/recipe/data/recipe_detail/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/model/ingredient.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/repository/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _ingredientDataSource;

  IngredientRepositoryImpl(this._ingredientDataSource);

  @override
  Future<List<Ingredient>> getIngredients() async {
    final ingredients = await _ingredientDataSource.getIngredients();
    return List.unmodifiable(ingredients);
  }
}
