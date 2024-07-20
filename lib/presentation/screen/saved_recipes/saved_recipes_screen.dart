import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:food_recipe_app/util/change_notifier_provider.dart';
import 'package:go_router/go_router.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        ChangeNotifierProvider.of<SavedRecipesViewModel>(context).value;

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
            final recipes = viewModel.savedRecipes;
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
                if (viewModel.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
