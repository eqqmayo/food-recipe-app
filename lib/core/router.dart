import 'package:food_recipe_app/core/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/core/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/saved_recipes/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/home/presentation/home_screen.dart';
import 'package:food_recipe_app/home/presentation/navigation_screen.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/search_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/recipe_detail_screen.dart.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/recipe_detail_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/search_recipes/search_recipes_screen.dart';
import 'package:food_recipe_app/recipe/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:food_recipe_app/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:food_recipe_app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/home/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      builder: (context, state) => NavigationScreen(
        HomeScreen(),
        ChangeNotifierProvider(
          create: (context) => SavedRecipesViewModel(
            GetRecipesUseCase(
              RecipeRepositoryImpl(
                RecipeDataSource(),
              ),
            ),
          ),
          child: const SavedRecipesScreen(),
        ),
      ),
    ),
    GoRoute(
      path: '/recipe_detail_screen',
      builder: (context, state) {
        final recipe = state.extra as Recipe;

        return ChangeNotifierProvider(
          create: (context) => RecipeDetailViewModel(
            IngredientRepositoryImpl(
              IngredientDataSource(),
            ),
            ProcedureRepositoryImpl(
              ProcedureDataSource(),
            ),
          ),
          child: RecipeDetailScreen(recipe: recipe),
        );
      },
    ),
    GoRoute(
      path: '/search_recipes_screen',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) {
          final getRecipesUseCase = GetRecipesUseCase(
            RecipeRepositoryImpl(
              RecipeDataSource(),
            ),
          );
          return SearchRecipesViewModel(
            getRecipesUseCase,
            SearchRecipesUseCase(getRecipesUseCase),
          );
        },
        child: const SearchRecipesScreen(),
      ),
    ),
  ],
);
