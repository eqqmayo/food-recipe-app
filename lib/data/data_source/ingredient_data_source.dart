import 'package:food_recipe_app/data/model/ingredient.dart';

class IngredientDataSource {
  final _ingredients = [
    const Ingredient(
        recipeId: 1, image: 'egg.jpeg', name: 'Egg', weight: '1 piece'),
    const Ingredient(
        recipeId: 1, image: 'octopus.jpeg', name: 'Octopus', weight: '1 cup'),
    const Ingredient(
        recipeId: 2, image: 'fish.jpg', name: 'Salmon', weight: '1 cup'),
    const Ingredient(
        recipeId: 2, image: 'avo.jpg', name: 'Avocado', weight: '1 piece'),
    const Ingredient(
        recipeId: 3, image: 'acai.jpg', name: 'Acai powder', weight: '3 spoon'),
    const Ingredient(
        recipeId: 3, image: 'banana.jpg', name: 'Banana', weight: '1 piece'),
    const Ingredient(
        recipeId: 4, image: 'egg.jpeg', name: 'Egg', weight: '1 piece'),
    const Ingredient(
        recipeId: 4, image: 'octopus.jpeg', name: 'Octopus', weight: '1 cup'),
    const Ingredient(
        recipeId: 5, image: 'egg.jpeg', name: 'Egg', weight: '1 piece'),
    const Ingredient(
        recipeId: 5, image: 'octopus.jpeg', name: 'Octopus', weight: '1 cup'),
    const Ingredient(
        recipeId: 6, image: 'fish.jpg', name: 'Salmon', weight: '1 cup'),
    const Ingredient(
        recipeId: 6, image: 'avo.jpg', name: 'Avocado', weight: '1 piece'),
    const Ingredient(
        recipeId: 7, image: 'acai.jpg', name: 'Acai powder', weight: '3 spoon'),
    const Ingredient(
        recipeId: 7, image: 'banana.jpg', name: 'Banana', weight: '1 piece'),
    const Ingredient(
        recipeId: 8, image: 'egg.jpeg', name: 'Egg', weight: '1 piece'),
    const Ingredient(
        recipeId: 8, image: 'octopus.jpeg', name: 'Octopus', weight: '1 cup'),
  ];

  Future<List<Ingredient>> getIngredients() async {
    return _ingredients;
  }
}
