import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SavedRecipesViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Saved recipes',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            final recipes = viewModel.state.savedRecipes;
            return Stack(
              children: [
                ListView(
                  children: recipes
                      .map(
                        (recipe) => Hero(
                          tag: recipe.id,
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
                if (viewModel.state.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
