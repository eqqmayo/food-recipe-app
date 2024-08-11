import 'package:food_recipe_app/recipe/domain/recipe_detail/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<List<Ingredient>> getIngredients();
}
