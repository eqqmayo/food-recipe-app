import 'package:food_recipe_app/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<List<Ingredient>> getIngredients();
}

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _ingredientDataSource;

  IngredientRepositoryImpl(this._ingredientDataSource);

  @override
  Future<List<Ingredient>> getIngredients() async {
    final ingredients = await _ingredientDataSource.getIngredients();
    return List.unmodifiable(ingredients);
  }
}
