import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Saved recipes',
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: _savedRecipesViewModel,
          builder: (context, child) {
            final recipes = _savedRecipesViewModel.savedRecipes;
            return Stack(
              children: [
                ListView(
                  children: recipes
                      .map(
                        (recipe) => Hero(
                          tag: recipe.title,
                          child: GestureDetector(
                            onTap: () {
                              context.push('/recipe_detail_screen',
                                  extra: recipe);
                            },
                            child: RecipeCard(recipe: recipe),
                          ),
                        ),
                      )
                      .toList(),
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
