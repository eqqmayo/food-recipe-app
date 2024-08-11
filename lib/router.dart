import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/core/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/home/domain/home_screen/use_case/get_recipes_by_category_use_case.dart';
import 'package:food_recipe_app/home/presentation/home_screen/home_view_model.dart';
import 'package:food_recipe_app/recipe/data/recipe_detail/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/recipe/data/recipe_detail/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/core/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/recipe/data/recipe_detail/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/recipe/data/recipe_detail/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/core/domain/model/recipe.dart';
import 'package:food_recipe_app/home/presentation/home_screen/home_screen.dart';
import 'package:food_recipe_app/home/presentation/navigation/navigation_screen.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/repository/ingredient_repository.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/repository/procedure_repository.dart';
import 'package:food_recipe_app/recipe/domain/recipe_detail/use_case/copy_link_use_case.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/domain/search_recipes/use_case/search_recipes_use_case.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_detail/recipe_detail_screen.dart.dart';
import 'package:food_recipe_app/recipe/presentation/recipe_detail/recipe_detail_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:food_recipe_app/recipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:food_recipe_app/recipe/presentation/search_recipes/search_recipes_screen.dart';
import 'package:food_recipe_app/recipe/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:food_recipe_app/auth/presentation/sign_in/sign_in_screen.dart';
import 'package:food_recipe_app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:food_recipe_app/home/presentation/splash/splash_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton(RecipeDataSource());
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));

  getIt.registerSingleton(IngredientDataSource());
  getIt.registerSingleton<IngredientRepository>(
      IngredientRepositoryImpl(getIt()));

  getIt.registerSingleton(ProcedureDataSource());
  getIt
      .registerSingleton<ProcedureRepository>(ProcedureRepositoryImpl(getIt()));

  getIt.registerSingleton(GetRecipesUseCase(getIt()));
  getIt.registerSingleton(SearchRecipesUseCase(getIt()));
  getIt.registerSingleton(GetRecipesByCategoryUseCase(getIt()));
  getIt.registerSingleton(CopyLinkUseCase());

  getIt.registerFactory(() => HomeViewModel(getIt(), getIt()));
  getIt.registerFactory(() => SavedRecipesViewModel(getIt()));
  getIt.registerFactory(() => SearchRecipesViewModel(getIt(), getIt()));
  getIt.registerFactory(() => RecipeDetailViewModel(getIt(), getIt(), getIt()));
}

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
      builder: (context, state) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => getIt<HomeViewModel>(),
            child: const HomeScreen(),
          ),
          ChangeNotifierProvider(
            create: (context) => getIt<SavedRecipesViewModel>(),
            child: const SavedRecipesScreen(),
          ),
        ],
        child: const NavigationScreen(
          HomeScreen(),
          SavedRecipesScreen(),
          Scaffold(body: Text('third')),
          Scaffold(body: Text('fourth')),
        ),
      ),
    ),
    GoRoute(
      path: '/recipe_detail_screen/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id']!) ?? 0;

        return FutureBuilder<Recipe?>(
          future: fetchRecipeById(id),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data == null) {
              return const Scaffold(
                  body: Center(child: Text('Recipe not found')));
            }
            return ChangeNotifierProvider(
              create: (context) => getIt<RecipeDetailViewModel>(),
              child: RecipeDetailScreen(recipe: snapshot.data!),
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/search_recipes_screen',
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => getIt<SearchRecipesViewModel>(),
        child: const SearchRecipesScreen(),
      ),
    ),
  ],
);

Future<Recipe?> fetchRecipeById(int id) async {
  return (await getIt<RecipeRepository>().getRecipes())
      .firstWhereOrNull((recipe) => recipe.id == id);
}
