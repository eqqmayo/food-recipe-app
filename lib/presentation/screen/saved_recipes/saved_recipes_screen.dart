import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:go_router/go_router.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel _savedRecipesViewModel;

  const SavedRecipesScreen(
    this._savedRecipesViewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListenableBuilder(
          listenable: _savedRecipesViewModel,
          builder: (context, child) {
            final recipes = _savedRecipesViewModel.savedRecipes;

            return Stack(
              children: [
                ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return Hero(
                      tag: recipe.title,
                      child: GestureDetector(
                        onTap: () {
                          context.push(
                            '/recipe_detail_screen',
                            extra: recipe,
                          );
                        },
                        child: RecipeCard(
                          recipe: Recipe(
                            thumbnail: recipes[index].thumbnail,
                            title: recipes[index].title,
                            creator: recipes[index].creator,
                            cookTime: recipes[index].cookTime,
                            rating: recipes[index].rating,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (_savedRecipesViewModel.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
