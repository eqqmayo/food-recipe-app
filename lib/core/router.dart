import 'package:food_recipe_app/data/data_source/saved_recipes_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/saved_recipes_repository.dart';
import 'package:food_recipe_app/presentation/screen/navigation.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/recipe_detail_screen.dart.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import 'package:food_recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:food_recipe_app/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:food_recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:food_recipe_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/screen/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash_screen',
  routes: [
    GoRoute(
      path: '/splash_screen',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/sign_in_screen',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: '/sign_up_screen',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/navigation',
      builder: (context, state) => Navigation(
        SavedRecipesScreen(
          SavedRecipesViewModel(
            SavedRecipeRepositoryImpl(
              SavedRecipeDataSource(),
            ),
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/recipe_detail_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return RecipeDetailScreen(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/search_recipes_screen',
      builder: (context, state) => SearchRecipesScreen(
        SearchRecipesViewModel(
          SavedRecipeRepositoryImpl(
            SavedRecipeDataSource(),
          ),
        ),
      ),
    ),
  ],
);
