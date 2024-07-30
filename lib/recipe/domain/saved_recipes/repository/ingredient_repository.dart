import 'package:food_recipe_app/recipe/domain/saved_recipes/model/ingredient.dart';

abstract interface class IngredientRepository {
  Future<List<Ingredient>> getIngredients();
}
